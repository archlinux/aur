# Maintainer: 7Ji <pugokughin@gmail.com>

_repo='amlogic-s9xxx-armbian'
_commit='099c353680b9f4584a7f71152b0a15d70d8fe114' # The current newest commit, although the firmware in it is not affected for a few commits after 20220916

pkgname=linux-firmware-amlogic-ophub
pkgver=20220916
pkgrel=1
pkgdesc="Firmware files for Linux - mainly for Aarch64 Amlogic platform, collected by ophub"
arch=('aarch64')
url="https://github.com/ophub/${_repo}"
license=('GPL2' 'GPL3' 'custom')
provides=("linux-firmware=${pkgver}")
conflicts=('linux-firmware')
options=(!strip)
source=(
  "${url}/archive/${_commit}.tar.gz"
)
sha256sums=(
  '7b0306993117d95a7ed33f138457fa90b7d231c1aa6833bbe7e2c55c8aae1543'
)

package() {
  install -d -m 755 "${pkgdir}"/usr
  tar -C "${pkgdir}"/usr -xvJf "${srcdir}/${_repo}-${_commit}/build-armbian/amlogic-armbian/firmware.tar.xz"
}