# maintainer: libele <libele@disroot.org>
# contributor: Alex Gentilucci <alexander.gentilucci@gmail.com>

pkgname=zilf
pkgver=0.9.0
_rlver=0.9
pkgrel=1
pkgdesc="A set of tools for working with the ZIL interactive fiction language, including a compiler, assembler, disassembler, and game library."
arch=('x86_64')
url="https://foss.heptapod.net/zilf/zilf"
license=('GPL')
options=('!strip')
source=("https://storage.googleapis.com/${pkgname}-releases/${_rlver}/${pkgname}-${pkgver}-linux-x64.tar.gz")
md5sums=('6e9697774bfb20f1b3768e6dff98b720')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"-linux-x64

  install -dm755 "${pkgdir}"/usr/bin
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 bin/* "${pkgdir}/usr/lib/${pkgname}"

  mv zillib "${pkgdir}/usr/lib/${pkgname}/zillib"
  mv sample "${pkgdir}/usr/share/${pkgname}/sample"

  ln -sf /usr/lib/"${pkgname}"/zilf "${pkgdir}"/usr/bin/zilf
  ln -sf /usr/lib/"${pkgname}"/zapf "${pkgdir}"/usr/bin/zapf
}
