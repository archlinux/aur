# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=selenoid
pkgname=${_base}-bin
pkgver=1.10.11
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
sha512sums_x86_64=('babe254bd0ef3df2695683177aebc751c57fbdee14df5597ced0dc9371195598ec4294fdd0a9788eecf8ff928fb93e38c097f785727adb8b12cde7af79397d8e')
sha512sums_aarch64=('23298aa43e274bdf42b4839945370e79ca295c1fa314e88ff2050d364bcef9e2f25e535d5d4de4882736d3617d74527be0edc908f0290b8805f773f7e4c7cfc1')

if [[ "$CARCH" == "x86_64" ]]; then _tar_arch='amd64'; fi
if [[ "$CARCH" == "aarch64" ]]; then _tar_arch='arm64'; fi

package() {
  install -Dm755 ${_base}-${pkgver}-${_tar_arch} "${pkgdir}/usr/bin/${_base}"
}
