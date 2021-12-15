# Maintainer: zan <zan@420blaze.it>

pkgname=krita-beta
_basever=5.0.0
_subver=beta5
pkgver="$_basever.$_subver"
pkgrel=1
pkgdesc="Edit and paint images - beta release"
arch=(x86_64)
url="https://krita.org"
license=(GPL3)
depends=(kio kseexpr fftw hicolor-icon-theme libraw gsl boost-libs exiv2 openexr poppler-qt5 opencolorio libheif quazip giflib)
makedepends=(extra-cmake-modules kdoctools python boost eigen)
optdepends=()
provides=(krita)
conflicts=(krita)
_target="krita-$_basever-$_subver"
source=("https://download.kde.org/unstable/krita/$_basever-$_subver/$_target.tar.xz")
sha256sums=('b9970cc7fd406db4418ff3359183b7df61fd3d5fa16c138d6b76206c484bc876')

build() {
    cmake -B build -S $_target
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
