# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pkarr-bin
pkgver=9.0.0
pkgrel=1
pkgdesc="Relay for Public Key Addressable Resource Records"
arch=('x86_64' 'aarch64')
url="https://github.com/pubky/pkarr"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pubky/pkarr/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pkarr-relay-v3.0.0-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pkarr-relay-v3.0.0-linux-arm64.tar.gz")
sha256sums=('089e801fd0cd8e0258a1e1fe226a1046bb2d702a5349a0ef5a0e232b39a29594')
sha256sums_x86_64=('4ad948a5708a2717070f4bbc8062e077f42ffc3b8c149f5c7a293bbdfee3af04')
sha256sums_aarch64=('87beb4d80f52f59a21e597f6e56cd80c559368c072fbb3afb3bc8edf46f90b3f')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="pkarr-relay-v3.0.0-linux-amd64" ;;
    aarch64) _dir="pkarr-relay-v3.0.0-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/pkarr-relay" "${pkgdir}/usr/bin/pkarr-relay"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
