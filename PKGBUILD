# Maintainer: r6eve <r6eve at acm dot org>

pkgname=selscan-bin
pkgver=v2.0.3
pkgrel=1
pkgdesc='Haplotype based scans for selection'
arch=('x86_64')
url='https://github.com/szpiech/selscan'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('61fd181aa751d10c78a9cb7985fc047f23c068eae95fe3ea071c5f1f4e77f34d')

package() {
  cd "${srcdir}/${pkgname%-bin}-${pkgver#v}"

  cp "bin/linux/${pkgname%-bin}-2.0.3" "bin/linux/${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/norm"
}
