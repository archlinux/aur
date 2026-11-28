# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-spotify-cli-bin
pkgver=1.0.80
pkgrel=1
pkgdesc="Control Spotify from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/Envoy49/go-spotify-cli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-spotify-cli_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-spotify-cli_linux_arm64.tar.gz")
sha256sums_x86_64=('680a65f6a2f7200e98ab0218b95ec5be309977a83319326b50330e5c9c184463')
sha256sums_aarch64=('aa1e9e61c180c3775764f4605c2096e98eebf00cc56ab03cbe4e52647871ec72')

package() {
  install -Dm755 "go-spotify-cli" "${pkgdir}/usr/bin/go-spotify-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
