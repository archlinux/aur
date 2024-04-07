# Maintainer: CYBERDEViL <cyberdev [at] disroot [dot] org>
pkgname=searx-qt
_pkgver=0.6.0-alpha2
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
sha512sums=("925b4659ae50c7ce816e64c3ed4ca4904690907da47bd5e8b4fb1b4ccaf027d9f828bc01cdc5fdbd33fb6f870a0ad34f2ff6e9227f86c2239d48dcae143b80a4")

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
