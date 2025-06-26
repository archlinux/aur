# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=wickedengine-editor
_pkgname=WickedEngine
pkgver=0.71.787
pkgrel=1
pkgdesc="3D engine with modern graphics "
arch=('any')
url="https://wickedengine.net/"
license=('MIT')
depends=("sdl2")
source=("https://github.com/turanszkij/$_pkgname/releases/download/v${pkgver}/Editor.Linux.zip")
sha256sums=('424df7ac52de8435a1060e82693926b1590148ffb4efb3d2be5f5330aee0dc97')

package() {
	install -d $pkgdir/opt/wickedengine
	cp -r $srcdir/{fonts,languages,config.ini,Editor_Linux,startup.lua} $pkgdir/opt/wickedengine

	printf "#!/bin/sh \n/opt/wickedengine/Editor_Linux" > wickedEngine
	install -Dm 755 wickedEngine $pkgdir/usr/bin/wickedEngine 
}
