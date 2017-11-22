# Maintainer: Tony Garcia <tony dot garcia at rackspace dot com>

pkgname='recap'
pkgdesc="System status reporting"
pkgver=1.2.0
pkgrel=1
arch=('any')
url="https://github.com/rackerlabs/${pkgname}"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname%-*})
depends=('coreutils' 'gawk' 'grep' 'iotop' 'procps-ng' 'sysstat' 'iproute2')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('029c07ee061ab7c95d347336b795559c4d1a4d81742d931e5ee4df959255293f')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr BINPATH=/bin install
}
