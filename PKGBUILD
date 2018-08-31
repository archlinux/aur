# Maintainer: Tony Garcia <tony dot garcia at rackspace dot com>

pkgname='recap'
pkgdesc="System status reporting"
pkgver=1.4.0
pkgrel=1
arch=('any')
url="https://github.com/rackerlabs/${pkgname}"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname%-*})
depends=('coreutils' 'gawk' 'grep' 'iotop' 'procps-ng' 'sysstat' 'iproute2')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('14afcd3f4cd6bcb4bb167ac2350baaf30790a39c9bd5a3668cdd8b612597a8e7')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr BINPATH=/bin install
}
