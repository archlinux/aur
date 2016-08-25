# Maintainer: droserasprout <droserasprout@tuta.io>

pkgname=airdcpp-webclient
pkgver=1.2.0
pkgrel=1
pkgdesc="A peer-to-peer file sharing client with web user interface"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/airdcpp-web/${pkgname}"
depends=('miniupnpc' 'boost' 'bzip2' 'zlib' 'openssl' 'glibc' 'geoip' 'leveldb' 'websocketpp' 'libnatpmp' 'intel-tbb')
makedepends=('git' 'make')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

package() {
    cd ${pkgname}
    cmake .
    make
    make install DESTDIR="$pkgdir"
}
