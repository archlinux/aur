# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.42.0
pkgrel=1
pkgdesc="Live reload for Go apps"
url="https://github.com/cosmtrek/${_base}"
arch=('x86_64' 'i686' 'aarch64')
license=(GPL3)
depends=(go)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=("${_base}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_base}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_base}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('4a38a2241c6f2dcbf115c74617d444a50ca8e53e039161c1cf19deedde1e2db5')
sha256sums_i686=('57a203c67e12c5029dc6bbf4525cfa0e40781b47c96c107850e9d7c2ae4c8724')
sha256sums_aarch64=('850b7cfa67ab2d895c366f6c589412495134f1d135bd3a3d89175e42a10ce9e5')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
