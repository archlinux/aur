# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=ampscan-bin
pkgver=1.5.6
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
sha256sums=('8620bdc5ccec86cba760232184ca40de04021a4adf7bb8b75de0caf69eb1b4f9'
            'd5cd9fe0211b0b49b8d7cc139a513167d0f7158fab1a3873d7110d2e52d28218')
sha256sums_x86_64=('f7fe8b836f3650f2f63e4a5a42efc077da6b94e76e7f7290ba9bbfecc7ddbae6')
sha256sums_aarch64=('8d896da6838d28de99875ad89a87a31a49d85609b728d40dc81dd574564563b6')

package() {
    install -Dm755 ampscan -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${pkgname}-${pkgver}.config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.toml.example"
}
