# Maintainer: Tim Lawrence <alkaliV02@gmail.com>
# Contributor: Allison Smith <alyway@protonmail.com>

pkgname=starfield-mod-loader-bin
pkgver=0.11.0
pkgrel=0
pkgdesc="A simple mod manager for Starfield that supports both Steam and Game Pass versions of the game."
arch=('x86_64')
url="https://github.com/lVlyke/starfield-mod-loader"
license=('GPL3')
depends=('nodejs' 'p7zip')
source=("https://github.com/lVlyke/starfield-mod-loader/releases/download/v${pkgver}/starfield-mod-loader-linux-x64_${pkgver}.7z"
				'starfield-mod-loader.sh')
sha256sums=('4a46cff9dced723829bfdb6666dd63e54706a84a5e361ce28f22305717edb5cf'
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
	chmod 755 "${pkgdir}/opt/${pkgname}/"

}
