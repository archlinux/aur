# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-bin
pkgver=0.35.1_beta
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
sha256sums=('85c6b4030b692ff778d60eee03a02a92ce10aeba6bb64c8c3c4ace7df326ad10'
            'SKIP')

package() {
	cd "${pkgdir}"
	bsdtar -xf "${srcdir}/data.tar.xz"
	install -Dm644 "${srcdir}/${pkgname%-bin}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
