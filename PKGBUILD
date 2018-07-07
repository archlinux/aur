# Maintainer: Opty <opty@hotmail.fr>

_gitname=JRomManager
pkgbase=jrommanager
pkgname=jrommanager
pkgver=1.5b18
pkgrel=1
pkgdesc='A Rom Manager entirely written in Java and released under GPL v3'
arch=('any')
license=('GPL3')
url="https://github.com/optyfr/JRomManager"
depends=('java-runtime>=8')
source=("https://github.com/optyfr/${_gitname}/releases/download/${pkgver}/${_gitname}-${pkgver}.zip"
	"${_gitname}.desktop" 
	"${_gitname}.png")

package() {
	install -d -m775 -g users "${pkgdir}/usr/share/java/${pkgname}/"
	install -d -m775 -g users "${pkgdir}/usr/share/java/${pkgname}/lib/"
	install -m664 -g users lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib/"
	install -m664 -g users *.jar "${pkgdir}/usr/share/java/${pkgname}/"
	install -Dm775 -g users *.sh "${pkgdir}/usr/share/java/${pkgname}/"

	install -D ${_gitname}.desktop "${pkgdir}/usr/share/applications/${_gitname}.desktop"
	install -D ${_gitname}.png "${pkgdir}/usr/share/pixmaps/${_gitname}.png"
}

# makepkg -g >> PKGBUILD

md5sums=('df8ef44e5edd830371b15b9dcea87987'
	'ca35b69a3ce8cad15944577cb2b17b13'
	'aa359e0e6eedc95e172355b83b2c6235')
