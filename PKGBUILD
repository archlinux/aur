# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-kwin-plugins
arch=("x86_64")
depends=(
    'kwin' 'qt5-base' 'qt5-declarative' 'kconfig'
    'kdecoration' 'kguiaddons' 'kcoreaddons' 'kconfigwidgets'
    'kwindowsystem' 'kwayland'
)
makedepends=('extra-cmake-modules' 'plasma-framework5')
pkgdesc="KWin plugin for LingmoOS"
pkgrel=2
pkgver=1.2.0_1

url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('7480345374769d6d81cd59c2443c49b18863f6c22ae454a9600a5e6b17729362')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}
package() {
    cd ${pkgname}-${pkgver//_/-}/build
    make DESTDIR="${pkgdir}" install
}
