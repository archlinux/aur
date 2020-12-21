# Maintainer: jakob <grandchild@gmx.net>

_pkgname=semaphore-bot
pkgname=python-${_pkgname}
pkgver=0.9.0
pkgrel=1
pkgdesc="A simple (rule-based) bot library for Signal Private Messenger."
arch=(x86_64 i686 aarch64)
url="https://github.com/lwesterhof/semaphore"
license=('AGPL3')
depends=(
    python
    "signald>=0.11.1"
    python-anyio
    python-attrs
    python-dateutil
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b23c0eb61ed2fbeb8d95a97a8cce128a87435b29fa0a7ad0e73180b4a7bf639e')

prepare() {
    sed -i '/attr==0.3.1/d' "$_pkgname-$pkgver/setup.py"
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
