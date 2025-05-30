# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis at martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=jello-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="CLI tool to filter JSON and JSON Lines data with Python syntax. (Similar to jq)"
arch=(
    'aarch64'
    'x86_64'
)
url='https://github.com/kellyjonbrazil/jello'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/kellyjonbrazil/jello/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums=('1a404c97debd32c80005736bd368078ccc8f858c8ebafa2576b0c3919afb92c4')
sha256sums_aarch64=('a7a644251c3cece2d1585aee4f9db452245a9b13c8530fc1701907145e8c6fb9')
sha256sums_x86_64=('cf5043f276d3d0858df0afd42961cfc77a8cbf1e9342c5ad1ca952b3115f07fd')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/local/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/man/man1/${pkgname%-bin}.1" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/changelog.gz" -t  "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}