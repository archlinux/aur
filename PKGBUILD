# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=parse-dmarc-bin
pkgver=1.7.3
pkgrel=1
pkgdesc="DMARC aggregate report parser with a built-in dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/dmarcguardhq/parse-dmarc"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/parse-dmarc_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/parse-dmarc_linux_arm64.tar.gz")
sha256sums_x86_64=('f9c7c4102937ab7e8224c022237acf58491bd49b840fa101cf2e694618b64c13')
sha256sums_aarch64=('25cd3b59e821a52a90ff570638835d585c46fcd3642e5b86935d5ab6e0752481')

package() {
  install -Dm755 "parse-dmarc" "${pkgdir}/usr/bin/parse-dmarc"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
