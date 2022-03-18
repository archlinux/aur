# Maintainer: Yubin Peng <1931127624@qq.com>
pkgname=zeno
pkgver=0.0.1
pkgrel=1
pkgdesc="Open-source node system framework for simulation and others"
arch=('x86_64')
url='https://gitee.com/zenustech/zeno'
license=('MPL2')
depends=("qt5-base")
makedepends=("git" "gcc" "cmake" "ninja")
optdepends=()
source=("${srcdir}/source::git+${url}.git")
noextract=()
md5sums=('SKIP')

prepare() {
    rm -rf ${pkgname}-${pkgver}
    mkdir -p ${pkgname}-${pkgver}
    mv source ${pkgname}-${pkgver}
}

package() {
    cd ${pkgname}-${pkgver}
    cd source
    cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}"
    cmake --build build
    cmake --build build --target install
}
