# Maintainer: emma <emma@bunny.church>
pkgname=sockseek-bin
pkgver=3.0.4
pkgrel=1
pkgdesc="Persistent Soulseek client with bulk download support for Spotify, YouTube, Bandcamp, and more"
arch=('x86_64' 'armv7h')
url="https://github.com/fiso64/sockseek"
license=('AGPL-3.0-only')
provides=('sockseek')
conflicts=('sockseek')
install=sockseek-bin.install
options=('!strip' '!debug')

_pkgver_tag="${pkgver//_dev./-dev.}"

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/fiso64/sockseek/releases/download/v${_pkgver_tag}/sockseek_${_pkgver_tag}_linux-x64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::https://github.com/fiso64/sockseek/releases/download/v${_pkgver_tag}/sockseek_${_pkgver_tag}_linux-arm.tar.gz")

sha256sums_x86_64=('22099a4f8030d94b4bf48bb9bd8cec5c81fa530228ade510abcb11a9530e2a48')
sha256sums_armv7h=('7937034f2c702f6548789f2f367bc83595914cfa368baff99203233bae2ae954')

package() {
    install -Dm755 sockseek "${pkgdir}/usr/bin/sockseek"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
