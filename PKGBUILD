# maintainer: libele <libele@disroot.org>

pkgname=zilf-bin
_binpkg=zilf
pkgver=0.9.0
_rlver=0.9
pkgrel=1
pkgdesc="A set of tools for working with the ZIL interactive fiction language, including a compiler, assembler, disassembler, and game library."
arch=('x86_64')
url="https://foss.heptapod.net/zilf/zilf"
license=('GPL')
provides=('zilf')
conflicts=('zilf')
options=('!strip')
source=("https://storage.googleapis.com/${_binpkg}-releases/${_rlver}/${_binpkg}-${pkgver}-linux-x64.tar.gz")
md5sums=('6e9697774bfb20f1b3768e6dff98b720')

package() {
  cd "${srcdir}/${_binpkg}-${pkgver}"-linux-x64

  install -dm755 "${pkgdir}"/usr/bin
  install -dm755 "${pkgdir}/usr/lib/${_binpkg}"
  install -dm755 "${pkgdir}/usr/share/${_binpkg}"

  install -Dm755 bin/* "${pkgdir}/usr/lib/${_binpkg}"

  cp -a zillib "${pkgdir}/usr/lib/${_binpkg}"
  cp -a sample "${pkgdir}/usr/share/${_binpkg}"

  ln -sf /usr/lib/"${_binpkg}"/zilf "${pkgdir}"/usr/bin/zilf
  ln -sf /usr/lib/"${_binpkg}"/zapf "${pkgdir}"/usr/bin/zapf
}
