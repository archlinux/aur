# Maintainer: chun-awa <chun-awa@outlook.com>
# Maintainer: Intro <intro-iu@outlook.com>
pkgname=lingmo-calculator
arch=("x86_64")
depends=("qt5-tools" "qt5-quickcontrols2")
makedepends=("extra-cmake-modules")
pkgdesc="A simple calculator."
pkgrel=1
pkgver=0.6.3
url="https://lingmo.org"
license=("GPL")
source=("https://github.com/LingmoOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6f4b9530c793c0321d727a58cf2c7f598e900cc7e2b529dee9ec2086dde7c125')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}
package() {
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
