# Maintainer: jakob <grandchild@gmx.net>

_pkgname=semaphore-bot
pkgname=python-${_pkgname}
pkgver=0.14.0
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
sha256sums=('8f7a200202ae94f13410774c17036be5ba02cd7b86b784644d9e19c54b54327c')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
