# Maintainer: CYBERDEViL <cyberdev [at] disroot [dot] org>
pkgname=searx-qt
_pkgver=0.6.0-alpha4
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
sha512sums=("a03bf42232cc9760775c1dbaa7eff4ed4149d512cc6c1ef1923d2252db36ac7d79073bcb726c43d49eac30e8a6ac85864c8b80294fff1418d831bad7e5e56d92")

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
