# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=uefitool-bin
pkgver=0.27.0
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor'
arch=('x86_64')
url="https://github.com/LongSoft/UEFITool"
license=('BSD2')
provides=("uefitool=${pkgver}" "uefipatch=${pkgver}" "uefireplace=${pkgver}")
source=("${url}/releases/download/${pkgver}/UEFIPatch_${pkgver}_linux_x86_64.zip"
		"${url}/releases/download/${pkgver}/UEFIReplace_${pkgver}_linux_x86_64.zip"
		"${url}/releases/download/${pkgver}/UEFITool_${pkgver}_linux_x86_64.zip")
md5sums=('32b2ec425adbf95896a529c7cf22cc52'
		 'da175c902bf98aab78a79f96036a2057'
		 '31cc44b9f9bfd28e4ace3d2d752449de')

package() {
  cd "${srcdir}"
  install -Dm755 UEFIPatch "${pkgdir}/usr/bin/uefipatch"
  install -Dm755 UEFIReplace "${pkgdir}/usr/bin/uefireplace"
  install -Dm755 UEFITool "${pkgdir}/usr/bin/uefitool"
  install -Dm644 *.txt -t "${pkgdir}/usr/share/uefitool/doc/"
}
# vim:set ts=2 sw=2 et: