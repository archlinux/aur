# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-bin
pkgver=1.14.0
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
sha256sums=('c5a7dcb9f5d0113fa651f1ba58fa5a42271949243e3a88dfe9a380a59d8cf9e3')
sha256sums_x86_64=('4a725548c716f61795b534938abf1d038c8ce5760ffad5e0490d4c20655b4e36')
sha256sums_aarch64=('580af1aca71a2a70d09db4daba8b747588c130f542e00cf6700532bf560ecdfe')

package() {
	cd "${pkgdir}"
	bsdtar -xf "${srcdir}/data.tar.xz"
	install -Dm644 "${srcdir}/${pkgname%-bin}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
