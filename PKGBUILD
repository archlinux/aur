# Maintainer: droserasprout <droserasprout@tuta.io>
# Contributor: atommixz <atommixz@gmail.com>

pkgname=airdcpp-webclient
pkgver=1.4.1
pkgrel=1
pkgdesc="A peer-to-peer file sharing client with web user interface"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="https://github.com/airdcpp-web/${pkgname}"
depends=('miniupnpc' 'boost' 'openssl' 'geoip' 'leveldb' 'websocketpp' 'libnatpmp' 'intel-tbb')
makedepends=('cmake' 'git' 'npm')
options=('!strip')
source=("git+${url}.git#tag=${pkgver}") 
sha256sums=('SKIP')

build() {
    cd ${pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd ${pkgname}
    make install DESTDIR="$pkgdir"
}
