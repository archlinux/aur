# Maintainer: Tony Garcia <tony dot garcia at rackspace dot com>

pkgname='recap'
pkgdesc="System status reporting"
pkgver=1.1.0
pkgrel=1
arch=('any')
url="https://github.com/rackerlabs/${pkgname}"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname%-*})
depends=('bc' 'coreutils' 'gawk' 'grep' 'iotop' 'procps-ng' 'sysstat'
         'net-tools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=("5f8650a0b68da6fb7a02ebf63a101b8a4e11d2563770bb6088f388f6b3a441af")

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr BINPATH=/bin install
}
