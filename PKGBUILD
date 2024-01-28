# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=selenoid
pkgname=${_base}-bin
pkgver=1.11.2
pkgrel=1
pkgdesc="Selenium Hub successor running browsers within containers"
arch=('x86_64' 'aarch64')
url="https://aerokube.com/${_base}"
license=(Apache)
source_x86_64=("${_base}-${pkgver}-amd64::https://github.com/aerokube/${_base}/releases/download/${pkgver}/${_base}_linux_amd64")
source_aarch64=("${_base}-${pkgver}-arm64::https://github.com/aerokube/${_base}/releases/download/${pkgver}/${_base}_linux_arm64")
options=(strip)
#depends=(glibc)
provides=("${_base}")
conflicts=("${_base}")
sha512sums_x86_64=('2e98baf8f32ec7b8d06488b78de0e7e697056c4e084438837bf22c35315af0b8b1747e35c4bcbb74fa36777daf86240842eb63822d03d8ec31bf980fb6327955')
sha512sums_aarch64=('d1bd4d51a569c30a8e51e55d2bed4005666cee37de78371aa8b3c21830faade6b0519546ea339b2f769681ee4d2e3cdd28d57cebffd694de71d37a05fe4b2538')

if [[ "$CARCH" == "x86_64" ]]; then _tar_arch='amd64'; fi
if [[ "$CARCH" == "aarch64" ]]; then _tar_arch='arm64'; fi

package() {
  install -Dm755 ${_base}-${pkgver}-${_tar_arch} "${pkgdir}/usr/bin/${_base}"
}
