# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=m3dviewer
pkgver=1.99.155
pkgrel=2
pkgdesc='Viewer for mozaik3D animations'
arch=(x86_64)
url='https://www.mozaweb.com/mozaik3D'
license=('unknown')
depends=(glu gtk2)
source=("https://download.mozaweb.com/$pkgname/${pkgname}_${pkgver}_x64.tar.gz")
md5sums=('62d94d1004b827186e71746de691804e')

package() {
	install -Dm644 "usr/share/applications/m3d.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$pkgname.png"     "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -dm755                                      "$pkgdir/usr/bin"
	ln -sf   "../../opt/mozaik/$pkgname/$pkgname.amd64" "$pkgdir/usr/bin/$pkgname"
	cp -r "opt" "$pkgdir"
	rm -r "$pkgdir/opt/mozaik/m3dviewer/m3dviewer_Data/Mono/x86" \
	      "$pkgdir/opt/mozaik/m3dviewer/m3dviewer_Data/Plugins/x86"
}

# vim: ts=2 sw=0 noet
