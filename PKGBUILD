# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
pkgname="kernelloader"
pkgver=3.0
pkgrel=1
pkgdesc="Set of BIOSes for various consoles."
arch=('any')
url="http://${pkgname}.sourceforge.net/linux.html"
depends=()
license=("GPL2")
source=("https://sourceforge.net/projects/kernelloader/files/Kernelloader/Kernelloader%20${pkgver}/kernelloader${pkgver}.tgz")
sha256sums=("c5e155b8b968418ff0f91a37f683fa9073acb2a0651e2e520fedcbcb8f9ec17a")

# shellcheck disable=SC2154
package(){
  local _platform="gamecube"
  local _dest="${pkgdir}/usr/share/${_platform}"
  local _file
  mkdir -p "${_dest}"
  for _file in "gc-"* ; do
    unzip -d "${_dest}" "${_file}"
  done
}
