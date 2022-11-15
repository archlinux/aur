# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=selenoid
pkgname=${_base}-bin
pkgver=1.10.9
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
sha512sums_x86_64=('3dd76f40b08d9756c80827321e6de92052ff4c0d3df0dff9aa26743b56631ec84c84dc2f8d2a28072061c658739011a3412df9d308c327596cd8017a56ecfb77')
sha512sums_aarch64=('297838e0f6d8603819770b9f119dab79a0a7c6558c04c74cb3184684b78a7e25addf7269c45ce78b5bdcda7eb97e828595aac3fc80fd9515c51528d2a4b92068')

if [[ "$CARCH" == "x86_64" ]]; then _tar_arch='amd64'; fi
if [[ "$CARCH" == "aarch64" ]]; then _tar_arch='arm64'; fi

package() {
  install -Dm755 ${_base}-${pkgver}-${_tar_arch} "${pkgdir}/usr/bin/${_base}"
}
