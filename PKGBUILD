# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=gazan
pkgver=0.4.0
pkgrel=1
pkgdesc="Browse, upload, download and manage cloud files with a GTK4 interface"
arch=('any')
url="https://codeberg.org/subhangadirli/gazan"
license=('GPL-3.0-or-later')
depends=(python gtk4 libadwaita rsync python-gobject)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/subhangadirli/gazan/archive/v$pkgver.tar.gz")
sha256sums=('99d56dc4a6a2d3e2ae0e5113d14dfbcab18d675dfaea8bfce2bf6aae9b79a1bf')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
