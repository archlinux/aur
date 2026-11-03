# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=ampscan-bin
pkgver=1.5.0
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
sha256sums=('220f84ee0ab6e8834a116e171185ae60c9e5f0392c7e02f6604943547d00c1f4'
            'd5cd9fe0211b0b49b8d7cc139a513167d0f7158fab1a3873d7110d2e52d28218')
sha256sums_x86_64=('5b14db2cc20bfce4ee8f054e5ece672ecf6400e435d3b11ae9eddc2906dc005e')
sha256sums_aarch64=('d33cb85c1975522152c94fc22291f9703b00244f5c266e779c7959884ed57731')

package() {
    install -Dm755 ampscan -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${pkgname}-${pkgver}.config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.toml.example"
}
