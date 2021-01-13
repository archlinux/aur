# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-xswitch
pkgver=0.1.6
pkgrel=1
pkgdesc='xswitch: an Interception Tools tool to redirect stdin to a muxer if a X window matches'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/xswitch'
depends=('interception-tools' 'glibc' 'libx11' 'libxmu')
makedepends=('boost' 'cmake' 'gcc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/plugins/xswitch/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('d0e0abf370d8eba7af95c8f062a96cabda5cf2affa438e831173ef0e89fb0b68')

build() {
    cd ${srcdir}/xswitch-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/xswitch-v${pkgver}-*/build

    make DESTDIR="$pkgdir/" install
}
