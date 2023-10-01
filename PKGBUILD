# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=hangul-attack
pkgver=20220121
pkgrel=1
pkgdesc="Game for practicing typing Hangul (Korean alphabet)."
arch=('any')
url="https://gobillykorean.com/free-korean-typing-game-hangul-attack-new-update-2021/"
license=('unknown')
options=("!strip")
source=("${pkgname}::https://gobillykorean.com/shop/File/get/?file=Hangul_Attack_Linux" "${pkgname}.png::https://gobillykorean.com/wp-content/uploads/2015/12/top_sitebanner.png")
sha256sums=('b5d6203aa4b1fe70a3ee9209af4917846eb8da9ba1aaf7fbf6bf1c2a2fff546f'
            '9912d75ae96e8f8fa380735ba90c6350dd60b8cbede36cc59e0abe95ba89f478')

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
