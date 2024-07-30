# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-bin
pkgver=0.51.0_beta
pkgrel=1
pkgdesc="Unofficial Warp Client for Windows/Mac/Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/bepass-org/oblivion-desktop"
license=("custom:${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: systray and indicator support')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("${pkgname%-bin}-${pkgver//_/-}-amd64.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-amd64.deb")
source_aarch64=("${pkgname%-bin}-${pkgver//_/-}-arm64.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm64.deb")
source=("${pkgname%-bin}-LICENSE::${url}/blob/main/LICENSE.md")
sha256sums=('SKIP')
sha256sums_x86_64=('218661993882107a248daac593c52ff83f651c34e61e4143db6b5d98774375e0')
sha256sums_aarch64=('8a15b47b712334820b168f21576d51570a6ce95cbc7a8297341a7c7de473d997')

package() {
	cd "${pkgdir}"
	bsdtar -xf "${srcdir}/data.tar.xz"
	install -Dm644 "${srcdir}/${pkgname%-bin}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
