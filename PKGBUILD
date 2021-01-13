# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-uswitch
pkgver=0.1.1
pkgrel=1
pkgdesc='uswitch: an Interception Tools tool to redirect stdin to a muxer if logged user matches'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/uswitch'
depends=('interception-tools' 'glibc')
makedepends=('boost' 'cmake' 'gcc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/plugins/uswitch/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('66659db28aeae1156541f9ac33f7a0d3fc78b0da35b30e607401c263a4834b10')

build() {
    cd ${srcdir}/uswitch-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/uswitch-v${pkgver}-*/build

    make DESTDIR="$pkgdir/" install
}
