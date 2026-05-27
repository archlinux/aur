# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=gazan
pkgver=0.5.5
pkgrel=1
pkgdesc="Browse, upload, download and manage cloud files with a GTK4 interface"
arch=('any')
url="https://codeberg.org/subhangadirli/gazan"
license=('GPL-3.0-or-later')
depends=(python gtk4 libadwaita rsync python-gobject)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/subhangadirli/gazan/archive/v$pkgver.tar.gz")
sha256sums=('4873225cf97f0b09777a791bec2398e93280c1ac53e6ed653dd8dde2e30ec963')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
