# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-xswitch
pkgver=0.1.2
pkgrel=1
pkgdesc='xswitch: an Interception Tools tool to redirect stdin to a muxer if a X window matches'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/xswitch'
depends=('interception-tools' 'glibc' 'libx11' 'libxmu')
makedepends=('boost' 'cmake' 'gcc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/plugins/xswitch/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('4946f5317c776e15882b75a67a817e1f368dbc5b520c2d9c45f692624c296358')

build() {
    cd ${srcdir}/xswitch-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/xswitch-v${pkgver}-*/build

    make DESTDIR="$pkgdir/" install
}
