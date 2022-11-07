# Maintainer: 7Ji <pugokughin@gmail.com>

_repo='amlogic-s9xxx-armbian'
_commit='099c353680b9f4584a7f71152b0a15d70d8fe114' # The current newest commit, although the firmware in it is not affected for a few commits after 20220916

pkgname=linux-firmware-amlogic-ophub
pkgver=20220916
pkgrel=1
pkgdesc="Firmware files for Linux - for AArch64 Amlogic platform, collected by ophub"
arch=('aarch64')
url="https://github.com/ophub/${_repo}"
license=('GPL2' 'GPL3' 'custom')
conflicts=('linux-firmware')
options=(!strip)
source=(
  "${url}/raw/${_commit}/build-armbian/amlogic-armbian/firmware.tar.xz"
)
sha256sums=(
  '0fe946da8ef60465b21356493c80481ec36f31e8e492ee816f2eeff999757e36'
)

package() {
  install -d -m 755 "${pkgdir}"/usr
  mv -v "${srcdir}/lib" "${pkgdir}/usr/"
}