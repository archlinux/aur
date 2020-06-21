

# Maintainer: Opty <opty@hotmail.fr>

_gitname=JRomManager
pkgbase=jrommanager-bin
pkgname=jrommanager-bin
pkgver=2.4.1
pkgrel=1
pkgdesc='A Rom Manager entirely written in Java and released under GPL v2'
arch=('any')
license=('GPL-2')
url="https://github.com/optyfr/JRomManager"
depends=('java-runtime>=8')
source=("https://github.com/optyfr/${_gitname}/releases/download/${pkgver}/${_gitname}-${pkgver}.zip"
	"${_gitname}.desktop" 
	"${_gitname}.png"
	"${_gitname}.sh")
options=(!strip)

package() {
	install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/"
	install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/lib/"
	install -m644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib/"
	install -m644 *.jar "${pkgdir}/usr/share/java/${pkgname}/"
	install -Dm755 *.sh "${pkgdir}/usr/share/java/${pkgname}/"
	cp -dpr --no-preserve=ownership webclient "${pkgdir}/usr/share/java/${pkgname}/"
	cp -dpr --no-preserve=ownership wrapper "${pkgdir}/usr/share/java/${pkgname}/"
	install -Dm755 ${_gitname}.sh "${pkgdir}/usr/bin/${pkgname}"

	install -D ${_gitname}.desktop "${pkgdir}/usr/share/applications/${_gitname}.desktop"
	install -D ${_gitname}.png "${pkgdir}/usr/share/pixmaps/${_gitname}.png"
}

# makepkg -g >> PKGBUILD
md5sums=('e9f5081c4939ebcdc33da24264b6228e'
         '0b48b210cac43d094a01295534a68e70'
         'aa359e0e6eedc95e172355b83b2c6235'
         '12b2b7268a0034338d2eedc8c875f5aa')
