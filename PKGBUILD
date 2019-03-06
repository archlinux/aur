# Maintainer: Tony Garcia <tony dot garcia at rackspace dot com>

pkgname='recap'
pkgdesc="System status reporting"
pkgver=2.0.2
pkgrel=1
arch=('any')
url="https://github.com/rackerlabs/${pkgname}"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname%-*})
depends=('coreutils' 'elinks' 'gawk' 'grep' 'iotop' 'procps-ng' 'sysstat' 'iproute2')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('be1128882f1f2e5b33c61fd0885892ea1521cba675e11095363039e07e02705c')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr BINPATH=/bin install
}
