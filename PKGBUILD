# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=gazan
pkgver=0.6.0
pkgrel=1
pkgdesc="Browse, upload, download and manage cloud files with a GTK4 interface"
arch=('any')
url="https://codeberg.org/subhangadirli/gazan"
license=('GPL-3.0-or-later')
depends=(python gtk4 libadwaita rsync python-gobject)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/subhangadirli/gazan/archive/v$pkgver.tar.gz")
sha256sums=('174f708dc83a1f3f563d3850fd75b018ea5a14a3eca70b5f93cde7b4f02e72fa')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
