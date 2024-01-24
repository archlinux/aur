# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor:

pkgname=starfield-mod-loader-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A simple mod manager for Starfield that supports both Steam and Game Pass versions of the game."
arch=('x86_64')
url="https://github.com/lVlyke/starfield-mod-loader"
license=('GPL3')
depends=('nodejs' 'p7zip')
source=("https://github.com/lVlyke/starfield-mod-loader/releases/download/v${pkgver}/starfield-mod-loader-linux-x64_${pkgver}.7z"
				'starfield-mod-loader.sh')
sha256sums=('97b421e09678b12123e1471c2f5468100180eb2f78bada7cfcec8e5d934b8045'
				'b7c938153b5fa38f3c382b72920ab0092327b1e3106df9b7224d7f55e9886e90')

package(){
	mkdir -p "${pkgdir}/opt"
	mkdir -p "${pkgdir}/usr/bin"

	# Extract package data
	7z x "starfield-mod-loader-linux-x64_${pkgver}.7z" -o"${pkgdir}/opt"

	mv "${pkgdir}/opt/starfield-mod-loader-linux-x64/" "${pkgdir}/opt/${pkgname}/"

	# ln -s "/opt/${pkgname}/starfield-mod-loader" "${pkgdir}/usr/bin/${pkgname}"
	cp "starfield-mod-loader.sh" "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"

}
