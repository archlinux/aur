# Maintainer: Opty <opty@hotmail.fr>

_gitname=JRomManager
pkgbase=jrommanager
pkgname=jrommanager
pkgver=1.9b29
pkgrel=4
pkgdesc='A Rom Manager entirely written in Java and released under GPL v3'
arch=('any')
license=('GPL-2')
url="https://github.com/optyfr/JRomManager"
depends=('java-runtime>=8')
source=("https://github.com/optyfr/${_gitname}/releases/download/${pkgver}/${_gitname}-${pkgver}.zip"
	"${_gitname}.desktop" 
	"${_gitname}.png"
	"${_gitname}.sh")

package() {
	install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/"
	install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/lib/"
	install -m644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib/"
	install -m644 *.jar "${pkgdir}/usr/share/java/${pkgname}/"
	install -Dm755 *.sh "${pkgdir}/usr/share/java/${pkgname}/"
	install -Dm755 ${_gitname}.sh "${pkgdir}/usr/bin/${pkgname}"

	install -D ${_gitname}.desktop "${pkgdir}/usr/share/applications/${_gitname}.desktop"
	install -D ${_gitname}.png "${pkgdir}/usr/share/pixmaps/${_gitname}.png"
}

# makepkg -g >> PKGBUILD

md5sums=('ca87ca6609b92c3e4bf1b69dc54b0775'
         'feb8697e8eea362a9b6ba5947975dc4c'
         'aa359e0e6eedc95e172355b83b2c6235'
         '33c717e50d5db9ca115bf063313bf1df')
