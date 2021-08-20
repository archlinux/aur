# Maintainer: zan <zan@420blaze.it>

pkgname=krita-beta
_basever=5.0.0
_subver=beta1
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
sha256sums=('49295a814dba12d3026954a7f50ab80a110611941cd30469cf27e310252edd6e')

build() {
    cmake -B build -S $_target
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
