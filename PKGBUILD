# Maintainer: Tony Garcia <tony dot garcia at rackspace dot com>

pkgname='recap'
pkgdesc="Generates reports of various system information"
pkgver=2.1.0
pkgrel=1
arch=('any')
url="https://github.com/rackerlabs/${pkgname}"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname%-*})
depends=('coreutils' 'elinks' 'gawk' 'grep' 'iotop' 'procps-ng' 'sysstat' 'iproute2')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('f8d473a4f383d8972c0f077c7b5c490f561b5afa10d0f20b0816cc067f038635')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr BINPATH=/bin install
}
