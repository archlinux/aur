# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hmetis-bin
pkgver=1.5.3
pkgrel=1
pkgdesc='hMETIS is a set of programs for partitioning hypergraphs such as those corresponding to VLSI circuits'
arch=('x86_64')
url="http://glaros.dtc.umn.edu/gkhome/metis/hmetis/overview"
license=('Apache-2.0')
provides=('hmetis')
noextract=("${pkgname}-${pkgver}")
source=("local:///hmetis-1.5-linux.tar.gz")
md5sums=('d114e45ecaec68a111866e964eccc5bf')

package() {
  install -Dm755 "${srcdir}/hmetis-1.5-linux/shmetis" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/hmetis-1.5-linux/hmetis" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/hmetis-1.5-linux/khmetis" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/hmetis-1.5-linux/manual.ps" -t "${pkgdir}/usr/share/doc/hmetis/"
  install -Dm644 "${srcdir}/hmetis-1.5-linux/COPYRIGHT" "${pkgdir}/usr/share/licenses/LICENSE"
  install -Dm644 "${srcdir}/hmetis-1.5-linux/libhmetis.a" -t "${pkgdir}/lib/hmetis"
  install -Dm644 "${srcdir}/hmetis-1.5-linux/s13207P.hgr" -t "${pkgdir}/usr/share/hmetis/examples/"
}
# vim:set ts=2 sw=2 et: