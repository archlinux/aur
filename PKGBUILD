# Maintainer: xifan <xifan2333@gmail.com>

pkgname=roxybrowser-bin
_pkgname=roxybrowser
pkgver=3.6.1
pkgrel=1
pkgdesc="Premier Antidetect Browser - Streamline Your Workflow Effortlessly"
arch=('x86_64')
url="https://roxybrowser.com"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: for system tray icon support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}.deb::https://dl.roxybrowser.com/app-download/Linux-64-latest")
sha256sums_x86_64=('SKIP')

package() {
	# Extract deb package
	bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.deb"
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

	# Fix permissions
	chmod 4755 "${pkgdir}/opt/RoxyBrowser/chrome-sandbox"
}
