# Maintainer: CYBERDEViL <cyberdev [at] disroot [dot] org>
pkgname=searx-qt
_pkgver=0.6.0-alpha1
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
sha512sums=("6e4bd1c68859616d80614651cecbbce06a34c2c93bbee3f2168f9021498debb9575f38f5f9441d61b42526eb14e9d09e25f4f98d14d46dbfcc61b9f2a48e6aeb")

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
