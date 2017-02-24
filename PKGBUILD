# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=dextra
pkgver=1.30.88
_filever=017
pkgrel=2
pkgdesc='A tool for DEX and OAT dumping, decompilation, and fuzzing'
arch=('i686' 'x86_64' 'armv7h')
url='http://newandroidbook.com/tools/dextra.html'
license=('unknown')

source=("http://newandroidbook.com/files/${pkgname}.tar")
sha256sums=('1a40cdf47525865552147ebb9c93f88213e54e15f8d3a32a828734c1f5b01e8f')

package() {
  mkdir -p "${pkgdir}/usr/bin"

  case "${CARCH}" in
    i686) install -m755 "${srcdir}/dextra" "${pkgdir}/usr/bin/dextra" ;;
    x86_64) install -m755 "${srcdir}/dextra.ELF64" "${pkgdir}/usr/bin/dextra" ;;
    armv7h) install -m755 "${srcdir}/dextra.armv7" "${pkgdir}/usr/bin/dextra" ;;
  esac
}
