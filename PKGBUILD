# Maintainer: Saren Arterius <saren@wtako.net>

# Contributor: Oliver Mangold <o.mangold@gmail.com>
# Maintainer: TheNiceGuy <gabrielpolloguilbert@gmail.com>

pkgname=bedup-fork-git
_pkgname=bedup
pkgver=0.10.1
pkgrel=2
pkgdesc="Offline deduplication utility for the BTRFS filesystem. Git, forked to fix some issues"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
depends=('python' 'python-distribute' 'python-alembic' 'python-sqlalchemy'
         'python-cffi' 'python-xdg' 'python-mako')
makedepends=('gcc' 'btrfs-progs')
url="https://github.com/g2p/bedup"
conflicts=('vpaint-git' 'bedup' 'bedup-git')
provides=()
source=("git+https://github.com/galvanized/bedup.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"

    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"

    python setup.py install --root "$pkgdir"
}
