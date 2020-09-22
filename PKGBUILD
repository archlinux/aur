# Maintainer: zan <zan@420blaze.it>

pkgname=krita-beta
_basever=4.4.0
_subver=beta1
pkgver="$_basever.$_subver"
pkgrel=1
pkgdesc="Edit and paint images - beta release"
arch=(x86_64)
url="https://krita.org"
license=(GPL3)
depends=(kio fftw hicolor-icon-theme libraw gsl boost-libs exiv2 openexr poppler-qt5 opencolorio libheif quazip giflib)
makedepends=(extra-cmake-modules kdoctools python boost eigen)
optdepends=()
provides=(krita)
conflicts=(krita)
_target="krita-$_basever-$_subver"
source=("https://download.kde.org/unstable/krita/$_basever-$_subver/$_target.tar.xz")
sha256sums=('e5254f9b5d84a7885ae8ef93fb79448acf0bf9f46fad1d537867419ddbf0455c')

build() {
    cmake -B build -S $_target
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
