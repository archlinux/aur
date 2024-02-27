# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=jello-bin
pkgver=1.6.0
pkgrel=5
pkgdesc="CLI tool to filter JSON and JSON Lines data with Python syntax. (Similar to jq)"
arch=('x86_64')
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kellyjonbrazil/jello/v${pkgver}/LICENSE"
)
sha256sums=('5c8b082bc14489d192a8a85390a7a7556e20fd4501ade3a905d949e0e038bd07'
            '1a404c97debd32c80005736bd368078ccc8f858c8ebafa2576b0c3919afb92c4')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/man/man1/${pkgname%-bin}.1" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/changelog.gz" -t  "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}