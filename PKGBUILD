# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=hangul-attack
pkgver=2.0
pkgrel=1
pkgdesc="Game for practicing typing Hangul (Korean alphabet)."
arch=('any')
url="https://gobillykorean.com/updated-free-hangul-typing-practice-game-new-version"
license=('unknown')
options=("!strip")
source=("${pkgname}::https://gobillykorean.com/shop/File/get/?file=Hangul_Attack_Linux" "${pkgname}.png::https://gobillykorean.com/wp-content/uploads/2015/12/top_sitebanner.png")
sha256sums=('74d503380d910dd37cc67df754b7b1ed22caa58f96cc7f158c99451ca6141963' '9912d75ae96e8f8fa380735ba90c6350dd60b8cbede36cc59e0abe95ba89f478')

package() {
	install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	mkdir -p -m755 "${pkgdir}/usr/share/applications/"
	printf "[Desktop Entry]
Version=${pkgver}
Type=Application
Name=Hangul Attack
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}
Categories=Game
Terminal=false
StartupNotify=true
" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
