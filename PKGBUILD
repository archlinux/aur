# Maintainer: 7Ji <pugokughin@gmail.com>

pkgname="uboot-legacy-initrd-hooks"
pkgver=0.0.1
pkgrel=1
pkgdesc="Pacman hooks and corresponding scripts to generate uboot legacy initrd"
arch=('aarch64')
license=('GPL3')
depends=(
  'initramfs'
  'uboot-tools'
)
source=(
  '59-uboot-legacy-initrd-remove.hook'
  '91-uboot-legacy-initrd-install.hook'
  'img2uimg'
  'uboot-legacy-initrd-install'
  'uboot-legacy-initrd-remove'
)
sha256sums=(
  '17a9b64ee4f83f66efa41f89154720d0c057b49b4648aafbfa662dc264abdb35'
  'bc402116fb372fd1565b051c0dbb41e47cb8a33e503ed90839b663b7e3892145'
  '7fd9e884b101d72dcf363438519bcf1f5e244a2317057e89e04921c7e1280f8e'
  '397a9a6b6ec98b2eaa0e084d3a98453090380051b6ae3b06a116f7d4425d0cd7'
  '89cce34474994ec498f2b5dbb04f8e4dd0e9edd3b8cbf5b7383461f4f3b3cf13'
)

package() {
  install -Dm644 "${srcdir}/${source[0]}" "${pkgdir}/usr/share/libalpm/hooks/${source[0]}"
  install -Dm644 "${srcdir}/${source[1]}" "${pkgdir}/usr/share/libalpm/hooks/${source[1]}"
  install -Dm755 "${srcdir}/${source[2]}" "${pkgdir}/usr/bin/${source[2]}"
  install -Dm755 "${srcdir}/${source[3]}" "${pkgdir}/usr/share/libalpm/scripts/${source[3]}"
  install -Dm755 "${srcdir}/${source[4]}" "${pkgdir}/usr/share/libalpm/scripts/${source[4]}"
}