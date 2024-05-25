# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=selenoid
pkgname=${_base}-bin
pkgver=1.11.3
pkgrel=1
pkgdesc="Selenium Hub successor running browsers within containers"
arch=(x86_64 aarch64)
url="https://aerokube.com/${_base}"
license=(Apache-2.0)
source_x86_64=(${_base}-${pkgver}-amd64::https://github.com/aerokube/${_base}/releases/download/${pkgver}/${_base}_linux_amd64)
source_aarch64=(${_base}-${pkgver}-arm64::https://github.com/aerokube/${_base}/releases/download/${pkgver}/${_base}_linux_arm64)
options=(strip)
#depends=(glibc)
provides=("${_base}")
conflicts=("${_base}")
sha512sums_x86_64=('bc7a68b1ea88c9d4a1fb8d0dffc15d2aba105fee69bcda142f7b9bfc3503f6df811d1e86cd209cec671186c201ef4e74b1966a8e043311d8502f21d49fc6d44c')
sha512sums_aarch64=('5378cf995cb95e58ff734936bd2bdd8eeb6e62ae63d20b072aa19ec61d3b36316b476df67b8424fa95bc0518d1f19097e5689e78720d13daf7040a60a35e6f0f')

if [[ "$CARCH" == "x86_64" ]]; then _tar_arch='amd64'; fi
if [[ "$CARCH" == "aarch64" ]]; then _tar_arch='arm64'; fi

package() {
  install -Dm755 ${_base}-${pkgver}-${_tar_arch} "${pkgdir}/usr/bin/${_base}"
}
