# Maintainer: Dinamyc <dinamycdinamyc at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=oblivion-desktop-bin
pkgver=3.10.0
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
sha256sums_x86_64=('8c1ca057ca68a272c9f022b6391b45b0b4b08d7ed4255d3efc1863e9b760a05a')
sha256sums_aarch64=('7bce1c9dbef91dffcccaa70bcacbe6f48a0921a9a850033471fd0f478b5bb86c')

options=(!debug !strip)

package() {
	cd "${pkgdir}"

	bsdtar -xf "${srcdir}/data.tar.xz"
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
