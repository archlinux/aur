# Contributor: Oliver Mangold <o.mangold@gmail.com>
# Maintainer: TheNiceGuy <gabrielpolloguilbert@gmail.com>

pkgname=bedup
pkgver=0.10.1
pkgrel=1
pkgdesc="Offline deduplication utility for the BTRFS filesystem"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
depends=('python' 'python-distribute' 'python-alembic' 'python-sqlalchemy'
         'python-cffi' 'python-xdg' 'python-mako')
makedepends=('gcc' 'btrfs-progs')
url="https://github.com/g2p/bedup"
conflicts=('vpaint-git')
provides=()
source=("https://github.com/g2p/bedup/archive/v$pkgver.tar.gz")
md5sums=('600129fb2e61c6f49034e2475cf1421d')
conflicts=('bedup-git')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python setup.py install --root "$pkgdir"
}
