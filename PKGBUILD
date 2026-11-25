# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=octo-cli-bin
pkgver=0.19.5
pkgrel=1
pkgdesc="Metadata-driven CLI for AI agent bots with structured JSON I/O"
arch=('x86_64' 'aarch64')
url="https://github.com/Mininglamp-OSS/octo-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/octo-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/octo-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('97cbd1d67d2cbd9e9cbc73465491724bf72babf60367acf6a0b53ef85b35cdbe')
sha256sums_aarch64=('d70b2203593e5e9665f679ffb24902b50d046e5b59461585df4611f617395b69')

package() {
  install -Dm755 "octo-cli" "${pkgdir}/usr/bin/octo-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
