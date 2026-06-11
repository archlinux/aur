# Maintainer: emma <emma@bunny.church>
pkgname=sockseek-bin
pkgver=3.0.0_dev.11
pkgrel=1
pkgdesc="Persistent Soulseek client with bulk download support for Spotify, YouTube, Bandcamp, and more"
arch=('x86_64' 'armv7h')
url="https://github.com/fiso64/sockseek"
license=('AGPL-3.0-only')
provides=('sockseek')
conflicts=('sockseek')
options=('!strip' '!debug')

_pkgver_tag="${pkgver//_dev./-dev.}"

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/fiso64/sockseek/releases/download/v${_pkgver_tag}/sockseek_linux-x64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::https://github.com/fiso64/sockseek/releases/download/v${_pkgver_tag}/sockseek_linux-arm.tar.gz")

sha256sums_x86_64=('dc4fecef7481e2fdac97ae82ce6d671269bbab97201737643969dc8cee0ec317')
sha256sums_armv7h=('4db1cf167a27cc82ea88dd14f496b99845613510b06ad07b4fbd4574c47ea910')

package() {
    install -Dm755 sockseek "${pkgdir}/usr/bin/sockseek"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
