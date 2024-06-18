# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-bin
pkgver=0.23.15_beta
pkgrel=2
pkgdesc="Unofficial Warp Client for Windows/Mac/Linux"
arch=('x86_64')
url="https://github.com/bepass-org/oblivion-desktop"
license=("custom:${pkgname%-bin}")
depends=('at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: systray and indicator support')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver//_/-}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-amd64.deb"
        "${pkgname%-bin}-LICENSE::${url}/blob/main/LICENSE.md")
sha256sums=('7e6d8d9aed8f724b68265c20fd785715de009bdfd23da3f245a9ea68fb0c0ea4'
            '3a4fceb841e4f82361cf60ad29f42ac6490771e4a82e3d1aec0b3facd8ae76a4')

package() {
	cd "${pkgdir}"
	bsdtar -xf "${srcdir}/data.tar.xz"
	install -Dm644 "${srcdir}/${pkgname%-bin}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
