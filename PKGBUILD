# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=dextra
pkgver=1.30.88
_filever=017
pkgrel=1
pkgdesc='A tool for DEX and OAT dumping, decompilation, and fuzzing'
arch=('i686' 'x86_64' 'armv7h')
url='http://newandroidbook.com/tools/dextra.html'
license=('unknown')

source=("http://newandroidbook.com/files/${pkgname}.tar")
md5sums=('82a8139d9b31d38cdffe76cc5cd23949')

package() {
  mkdir -p "${pkgdir}/usr/bin"

  case "${CARCH}" in
    i686) install -m755 "${srcdir}/dextra" "${pkgdir}/usr/bin/dextra" ;;
    x86_64) install -m755 "${srcdir}/dextra.ELF64" "${pkgdir}/usr/bin/dextra" ;;
    armv7h) install -m755 "${srcdir}/dextra.armv7" "${pkgdir}/usr/bin/dextra" ;;
  esac
}
