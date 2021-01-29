# Maintainer: Aggam Rahamim (agamclass@gmail.com)
# Original developer: github @matvelloso (see "url")
# I have not developed this app and take 0 credit.

pkgname=office365-electron
pkgver=1.1.2
pkgrel=1
pkgdesc="This is a unofficial, unsupported cross platform Electron wrapper for Office 365."
arch=('x86_64')
url="https://github.com/matvelloso/electron-office"
license=('MIT')
depends=("at-spi2-core"
		"desktop-file-utils"
		"gtk3"
		"hicolor-icon-theme"
		"libappindicator-gtk3"
		"libnotify"
		"libsecret"
		"libxss"
		"libxtst"
		"nss"
		"util-linux-libs"
		"xdg-utils"
		)
conflicts=()
replaces=()
source=("${url}/releases/download/${pkgver}/office.office365_${pkgver}_amd64.deb"
		"https://raw.githubusercontent.com/matvelloso/electron-office/master/LICENSE"
		)
noextract=("office.office365_${pkgver}_amd64.deb")
sha256sums=('8a5871097a2885e729a5be7321311e631e190f1792a22661ff805d540d6fbcaa'
			'950f03fa1295a1f0d848fc0cd5d874fa58952b9a46358eee21d24a751bf2c749'
			)

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  	bsdtar -O -xf "office.office365_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
