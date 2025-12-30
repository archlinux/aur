# Maintainer: Dinamyc <dinamycdinamyc at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-bin
pkgver=3.11.0
pkgrel=0
pkgdesc="Unofficial Warp Client for Windows/Mac/Linux (Pre-compiled version)"
arch=('x86_64' 'aarch64')
url="https://github.com/bepass-org/oblivion-desktop"
license=("custom:${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils' 'polkit')
optdepends=('libappindicator-gtk3: systray and indicator support')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")

source_x86_64=("${pkgname%-bin}-${pkgver//_/-}-amd64.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-amd64.deb")
source_aarch64=("${pkgname%-bin}-${pkgver//_/-}-arm64.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm64.deb")
source=("https://raw.githubusercontent.com/bepass-org/${pkgname%-bin}/refs/tags/v${pkgver//_/-}/LICENSE.md")

sha256sums=('1030cbd64a888ed7b945ba92fa9468fc3f29176e86f046f5cc620c68a6cfde64')
sha256sums_x86_64=('f215284845c87946f6a19e1583cf09021d4008e9f8f9fe02beb86beef8771272')
sha256sums_aarch64=('a5ad97c89fd749922c5e8e4f02342a28b40cc1b121a83256f030ac8165eaf545')

options=(!debug !strip)

package() {
	cd "${pkgdir}"

	bsdtar -xf "${srcdir}/data.tar.xz"
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
