# Maintainer: Tim Lawrence <a********2@gmail.com>
# Contributor: Allison Smith <alyway@protonmail.com>

pkgname=stellar-mod-loader-bin
pkgver=0.13.2
pkgrel=0
pkgdesc="Stellar is a mod manager for Windows and Linux that supports games including Fallout, Skyrim, and Starfield. Formerly known as Starfield Mod Loader"
arch=('x86_64')
replaces=('starfield-mod-loader-bin')
conflicts=('starfield-mod-loader-bin')
url="https://github.com/lVlyke/stellar-mod-loader"
license=('GPL3')
depends=('nodejs' 'p7zip')
source=("https://github.com/lVlyke/stellar-mod-loader/releases/download/v${pkgver}/stellar-mod-loader-linux-x64_0.13.2.7z"
				'stellar-mod-loader.sh')
sha256sums=('c86b27171324d56efcce86af10f0e0edaa70ef57a8635038a1ab1e41609a9819'
				'7762cd7b97ada391230d5081568edbf4d194e0a304d36ac81e83b5c46d8fed42')

package(){
	mkdir -p "${pkgdir}/opt"
	mkdir -p "${pkgdir}/usr/bin"

	# Extract package data
	7z x "stellar-mod-loader-linux-x64_0.13.2.7z" -o"${pkgdir}/opt"

	mv "${pkgdir}/opt/stellar-mod-loader-linux-x64/" "${pkgdir}/opt/${pkgname}/"

	# ln -s "/opt/${pkgname}/stellar-mod-loader" "${pkgdir}/usr/bin/${pkgname}"
	cp "stellar-mod-loader.sh" "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
	chmod 755 "${pkgdir}/opt/${pkgname}/"

}
