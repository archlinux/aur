# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.52.1
pkgrel=1
pkgdesc="Live reload for Go apps"
url="https://github.com/cosmtrek/${_base}"
arch=(x86_64 i686 aarch64)
license=(GPL-3.0-or-later)
depends=(go)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=("${_base}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_base}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_base}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('05fe834091fc701c4a6961a8f3434372ae7b1128e7e02b6fe3e91685780013f0')
sha256sums_i686=('173481c7d04a1cc230336034b6a0a862b25cd0ad445d88b4c412f0ab52e8a418')
sha256sums_aarch64=('452c845f1cae7e4682a299ad4e6a516a84f9842219bbf75b145b6bf258e3e316')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
