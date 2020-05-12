# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hmetis-bin
pkgver=1.5.3
pkgrel=1
pkgdesc='A set of programs for partitioning hypergraphs such as those corresponding to VLSI circuits'
arch=('x86_64')
url="http://glaros.dtc.umn.edu/gkhome/metis/hmetis/overview"
license=('custom')
provides=('hmetis')
depends=('lib32-glibc')
source=("${pkgname}-${pkgver}.tar.gz::http://glaros.dtc.umn.edu/gkhome/fetch/sw/hmetis/hmetis-1.5-linux.tar.gz")
sha256sums=('e835a098c046e9c26cecb8addfea4d18ff25214e49585ffd87038e72819be7e1')

package() {
  install -Dm755 "${srcdir}/hmetis-1.5-linux/shmetis" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/hmetis-1.5-linux/hmetis" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/hmetis-1.5-linux/khmetis" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/hmetis-1.5-linux/manual.ps" -t "${pkgdir}/usr/share/doc/hmetis/"
  install -Dm644 "${srcdir}/hmetis-1.5-linux/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/hmetis-1.5-linux/libhmetis.a" -t "${pkgdir}/usr/lib/hmetis"
  install -Dm644 "${srcdir}/hmetis-1.5-linux/s13207P.hgr" -t "${pkgdir}/usr/share/hmetis/examples/"
}
# vim:set ts=2 sw=2 et: