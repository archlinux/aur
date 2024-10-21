# Maintainer: jakob <grandchild@gmx.net>

_pkgname=semaphore-bot
pkgname=python-${_pkgname}
pkgver=0.17.0
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
sha256sums=('df36faf8774e07af98ad545c9881eca2414a50e94598a0a854d965bccf9a3974')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
