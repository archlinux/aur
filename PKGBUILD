# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-bin
pkgver=1.1.0
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
sha256sums_x86_64=('a73437f6b0497a0612923f9883fa1ef79d4a297d8f3451c7489f1210d24bc4da')
sha256sums_aarch64=('76520f7646386c525644096b9952fbace322753bef466bd5a0529e2d82e5969a')

package() {
	cd "${pkgdir}"
	bsdtar -xf "${srcdir}/data.tar.xz"
	install -Dm644 "${srcdir}/${pkgname%-bin}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
