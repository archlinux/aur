# Maintainer: Felix Kauselmann <licorn@gmail.com>
# Contributor: droserasprout <droserasprout@tuta.io>
# Contributor: atommixz <atommixz@gmail.com>

pkgname=airdcpp-webclient
pkgver=2.13.2
pkgrel=2
pkgdesc="A peer-to-peer file sharing client with web user interface"
arch=('x86_64' 'armv7h')
license=('MIT')
url="https://github.com/airdcpp-web/${pkgname}"
depends=('miniupnpc' 'boost' 'libmaxminddb' 'leveldb' 'openssl' 'geoip' 'leveldb' 'websocketpp' 'libnatpmp' 'intel-tbb')
makedepends=('cmake' 'git' 'npm' 'ninja' 'nlohmann-json' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/airdcpp-web/airdcpp-webclient/archive/${pkgver}.tar.gz") 
sha256sums=('5d5a589c3e3acd57c8364fa1d06a3973c332b44343bca7b7c8e03eb383b896d3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake ./ -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib
    ninja
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" ninja install
}
