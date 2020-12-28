# Maintainer: jakob <grandchild@gmx.net>

_pkgname=semaphore-bot
pkgname=python-${_pkgname}
pkgver=0.9.1
pkgrel=1
pkgdesc="A simple (rule-based) bot library for Signal Private Messenger."
arch=(x86_64 i686 aarch64)
url="https://github.com/lwesterhof/semaphore"
license=('AGPL3')
depends=(
    python
    signald-git
    python-anyio
    python-attrs
    python-dateutil
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('0234b0c69472d437d7a0eec1d16639ed7b7e478299b4efafad6fe11dfc4f730e')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
