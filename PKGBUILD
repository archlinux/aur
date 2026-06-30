# Maintainer: emma <emma@bunny.church>
pkgname=sockseek-bin
pkgver=3.0.1
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

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/fiso64/sockseek/releases/download/v${_pkgver_tag}/sockseek_linux-x64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::https://github.com/fiso64/sockseek/releases/download/v${_pkgver_tag}/sockseek_linux-arm.tar.gz")

sha256sums_x86_64=('ab97203d56faf5a513a2a7efafc387e5a07148a9ecaf1d9b46bf61f83be5e44e')
sha256sums_armv7h=('01914bada0a194b08c21c6673affe5299435c22882fd17cd3e2fdac81f6b82d4')

package() {
    install -Dm755 sockseek "${pkgdir}/usr/bin/sockseek"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
