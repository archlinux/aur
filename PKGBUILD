# Maintainer: Daniel Barbosa <dbarbosa0 at gmail dot com>

pkgname=plotxy
pkgver=nov2018
pkgrel=2
pkgdesc="A plotting and post-processing program developed by prof. Massimo Ceraolo from the University of Pisa, as part of his research activities involving simulation and post-processing of measured data"
arch=('x86_64')
url="http://ceraolo-plotxy.ing.unipi.it/default.htm"
license=(GPL3)
depends=(qt5-svg)
conflicts=()
source=(http://ceraolo-plotxy.ing.unipi.it/PlotXY_Download/PlotXY-2018-Nov-Linux.zip)
sha256sums=('62876fb6329de24a09c7088ef70976ec726d409041cfa9c28d163b8483df1306')

package() {
	
	cd "$srcdir"/PlotXY-2018-Nov-Linux
	chmod +x PlotXY.AppImage
	./PlotXY.AppImage  --appimage-extract 
	cd squashfs-root
	install -d "$pkgdir"/opt/$pkgname
	cp PlotXY "$pkgdir"/opt/$pkgname
	install -d "$pkgdir"/usr/local/bin/
        

  install -Dm644 "${startdir}/plotxy.desktop" "${pkgdir}/usr/share/applications/plotxy.desktop"
  install -Dm644 "${startdir}/plotxy.png" "${pkgdir}/usr/share/pixmaps/plotxy.png"
  install -Dm755 "${startdir}/plotxy"   "${pkgdir}/opt/${pkgname}"
  
  ln -s /opt/$pkgname/plotxy  "$pkgdir"/usr/local/bin/plotxy

}

