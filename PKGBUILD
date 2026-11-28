# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=spiffe-vault-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Secretless Vault authentication using SPIFFE"
arch=('x86_64' 'aarch64')
url="https://github.com/philips-labs/spiffe-vault"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/spiffe-vault_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/spiffe-vault_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4ceb4dda83820c85a542fb0f4bcab4b18805d6505425650e9da02bdd6e31c751')
sha256sums_aarch64=('e6340bf76a44cf8a4cbf9cd599b8fa83444f733b3edf82c821e85a5c5c8dac7d')

package() {
  install -Dm755 "spiffe-vault" "${pkgdir}/usr/bin/spiffe-vault"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
