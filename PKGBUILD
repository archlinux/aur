# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=selenoid
pkgname=${_base}-bin
pkgver=1.11.0
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
sha512sums_x86_64=('5cc9e0841207f7a535d14397788377436d4d5a09ab6dba924776490e21231f88044f7d35e05420804bc424af4d5ea06459f3ff0373d1348616d1b89abdc738e7')
sha512sums_aarch64=('b11c5afe8ca4f0a0f6235ecb5938b36e8739a11ead8a9b03ccf3d9a32512af0d4418b4f4104b4f571d2db1806b628885acf35f398cf8992e7187c96c7fb3b1f5')

if [[ "$CARCH" == "x86_64" ]]; then _tar_arch='amd64'; fi
if [[ "$CARCH" == "aarch64" ]]; then _tar_arch='arm64'; fi

package() {
  install -Dm755 ${_base}-${pkgver}-${_tar_arch} "${pkgdir}/usr/bin/${_base}"
}
