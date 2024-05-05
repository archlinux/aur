# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.52.0
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

sha256sums_x86_64=('e1a3340f5ecbcee5f31e65a57d75b189f045039a096a601c2ead6cc05b776378')
sha256sums_i686=('54907d177a221d8718b8bb6fcf742d589ea47ff1a4474fbf21e43c2fd1d577fe')
sha256sums_aarch64=('e9f4d2ff88d588e77c31e9d4ad0e7ce09767e70c57e7e2633ee15940d91b771a')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
