# Maintainer: CYBERDEViL <cyberdev [at] disroot [dot] org>
pkgname=searx-qt
_pkgver=0.6.1-alpha
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Desktop client application for Searx/SearXNG/searx-space"
arch=("any")
url="https://notabug.org/CYBERDEViL/searx-qt"
license=("GPL3")
depends=(
    "python-requests" "python-pyqt5" "python-jsonschema"
    "python-beautifulsoup4")
optdepends=(
    "python-pysocks: socks proxy support"
    "python-pillow: thumbnail support")
makedepends=(
    "gettext" "qt5-tools" "python-setuptools" "python-build"
    "python-installer" "python-wheel" "make")
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha512sums=("a9bb5aef81ee137348f0be5bf7b8abf8068bde75a4b2aca86f51edea6447560bdeab805aacd28ac6f4b2f4c668388982c3649f783038c99163dc3b7c698f0a04")

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
