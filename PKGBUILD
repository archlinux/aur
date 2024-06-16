# Maintainer: CYBERDEViL <cyberdev [at] disroot [dot] org>
pkgname=searx-qt
_pkgver=0.6.0-alpha3
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
sha512sums=("cde045a1c6921e33d8484655e35609e571d6dd02afe6ab8997828adc8bd266505a46208fc6e9fa97a4596edb277edceb3ea38a79db5e3c427c9984f791520e67")

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
