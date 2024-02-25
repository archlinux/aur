# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.51.0
pkgrel=1
pkgdesc="Live reload for Go apps"
url="https://github.com/cosmtrek/${_base}"
arch=('x86_64' 'i686' 'aarch64')
license=(GPL-3.0-or-later)
depends=(go)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=("${_base}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_base}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_base}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('61d35e77b526cf4cfd63ec9004ddc8f30cde80ddf0f6fa247912fff85d88a24a')
sha256sums_i686=('86cd383c5139a87dda5e955eabb485324c272e4057c9f729e59070f22a9af1e9')
sha256sums_aarch64=('28d958ee0c757f02e738e7f8f6deb88eb8177ba9daaa67763a506241033a7419')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
