# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=wickedengine-editor
pkgver=0.71.532
pkgrel=1
pkgdesc="3D engine with modern graphics "
arch=('any')
url="https://wickedengine.net/"
license=('MIT')
depends=("sdl2")
source=("https://github.com/turanszkij/$pkgname/releases/download/v${pkgver}/Editor.Linux.zip")
sha256sums=('7be7c94cfb4526f64ca0aee382aa781cf29e0d0c57c5568000d490a131d0aeaa')

package() {
	install -d $pkgdir/opt/wickedengine
	cp -r $srcdir/{fonts,languages,config.ini,Editor_Linux,startup.lua} $pkgdir/opt/wickedengine

	printf "#!/bin/sh \n/opt/wickedengine/Editor_Linux" > wickedEngine
	install -Dm 755 wickedEngine $pkgdir/usr/bin/wickedEngine 
}
