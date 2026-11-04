# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=ampscan-bin
pkgver=1.5.2
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
sha256sums=('fba30e161216e75b82f0f2abe40845273e0ce21ad2745a5b4843137ae29c68c6'
            'd5cd9fe0211b0b49b8d7cc139a513167d0f7158fab1a3873d7110d2e52d28218')
sha256sums_x86_64=('16c1394bc924fcc29d2aba4e14c96b946d94bf71a6ba0a3880611382ca2e6a82')
sha256sums_aarch64=('ac4e6202c8b6cd36e683dac09e122a94e7fbea40e228a921ebfd0095213195de')

package() {
    install -Dm755 ampscan -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}.README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${pkgname}-${pkgver}.config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.toml.example"
}
