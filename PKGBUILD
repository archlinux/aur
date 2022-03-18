# Maintainer: Yubin Peng <1931127624@qq.com>
pkgname=zeno
pkgver=2022.3.18
pkgrel=1
pkgdesc="Open-source node system framework for simulation and others"
arch=('x86_64')
url='https://gitee.com/zenustech/zeno'
license=('MPL2')
depends=("qt5-base")
makedepends=("gcc" "cmake" "ninja")
optdepends=()
source=("zeno-release.tar.gz::https://github.com/zenustech/zeno/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

prepare() {
    rm -rf ${pkgname}-${pkgver}
    mkdir -p ${pkgname}-${pkgver}
    cd ${pkgname}-${pkgver}
    tar zxvf zeno-release.tar.gz --directory=zeno-release
}

package() {
    cd ${pkgname}-${pkgver}
    cd zeno-release
    cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}"
    cmake --build build
    cmake --build build --target install
}
