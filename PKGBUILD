# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-space2meta
pkgver=0.2.0
pkgrel=1
pkgdesc='space2meta: turn space into meta when chorded to another key (on release)'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/space2meta'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
source=("https://gitlab.com/interception/linux/plugins/space2meta/-/archive/v${pkgver}/space2meta-v${pkgver}.tar.gz")
sha256sums=('75712d96a91ca377bb47976725a39e751480f8f61aea902b3372310b04b4487a')

build() {
    cd ${srcdir}/space2meta-v${pkgver}
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/space2meta-v${pkgver}/build

    make DESTDIR="$pkgdir/" install
}
