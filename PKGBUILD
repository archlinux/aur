# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=selenoid
pkgname=${_base}-bin
pkgver=1.10.12
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
sha512sums_x86_64=('5dec7cc76c0a1271622cfecd28839850c41c9061d959e2fdeee476133748e530ab7dab92bc5637462040816a844775451eb8eed350c0e048a0c9f6b3e99a5ada')
sha512sums_aarch64=('9cef920e7ca7b314a178fd641ae118209c4abd03b1f62b6d12562e1817b4857a21ed8d0f446c86bec26f8cf2affd96951d2e3c2f4185d93f8795a7aaafaa6fe9')

if [[ "$CARCH" == "x86_64" ]]; then _tar_arch='amd64'; fi
if [[ "$CARCH" == "aarch64" ]]; then _tar_arch='arm64'; fi

package() {
  install -Dm755 ${_base}-${pkgver}-${_tar_arch} "${pkgdir}/usr/bin/${_base}"
}
