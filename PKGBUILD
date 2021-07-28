# Maintainer: Felix Kauselmann <licorn@gmail.com>
# Contributor: droserasprout <droserasprout@tuta.io>
# Contributor: atommixz <atommixz@gmail.com>

pkgname=airdcpp-webclient
pkgver=2.11.1
pkgrel=1
pkgdesc="A peer-to-peer file sharing client with web user interface"
arch=('x86_64' 'armv7h')
license=('GPL2')
url="https://github.com/airdcpp-web/${pkgname}"
depends=('miniupnpc' 'boost' 'libmaxminddb' 'leveldb' 'openssl' 'geoip' 'leveldb' 'websocketpp' 'libnatpmp' 'intel-tbb')
makedepends=('cmake' 'git' 'npm')
source=("https://github.com/airdcpp-web/airdcpp-webclient/archive/${pkgver}.tar.gz") 
md5sums=('56023e6bb3e07edd88c0b5133768c094')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/airdcpp-core"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
