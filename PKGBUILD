# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=ampscan-bin
pkgver=1.5.7
pkgrel=1
pkgdesc='Audit IPv4/IPv6 networks for ports exploitable in DDoS amplification attacks'
arch=('x86_64' 'aarch64')
url='https://github.com/gondimcodes/ampscan'
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
depends_x86_64=('openssl')
provides=('ampscan')
conflicts=('ampscan')
options=('!debug')
source=("${pkgname}-${pkgver}.README.md::${url}/raw/v${pkgver}/README.md"
        "${pkgname}-${pkgver}.config.toml::${url}/raw/v${pkgver}/config.toml")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/ampscan-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/ampscan-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('4286bfc4b2801c299ce05a726d4f163829941b4561033cbbe4aa899a0562d731'
            'd5cd9fe0211b0b49b8d7cc139a513167d0f7158fab1a3873d7110d2e52d28218')
sha256sums_x86_64=('e2d80ed72392eff7fee4cc0f848bb01772eb3f1d1965f20c8e95c18fd5b57ecb')
sha256sums_aarch64=('82291cd898c82b8e6a97dc7441d635c7d8e7a3494cb1cc7dc58836cb594de3cd')

package() {
    install -Dm755 ampscan -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${pkgname}-${pkgver}.config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.toml.example"
}
