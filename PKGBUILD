# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=m3dviewer
pkgver=2.0.637
pkgrel=1
pkgdesc='Viewer for mozaik3D animations'
arch=(x86_64)
url='https://www.mozaweb.com/mozaik3D'
license=('unknown')
depends=(glibc gcc-libs)
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')
source=("https://download.mozaweb.com/m3dviewer/m3dViewer_${pkgver}_x64.tar.gz")
sha256sums=('6d07e2fe6bf1149110bdddb11a29a45ac811706d35d7464516f81131c5e9c8dc')

package() {
	install -Dm644 "usr/share/applications/m3d.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$pkgname.png"     "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -dm755                                      "$pkgdir/usr/bin"
	ln -sf   "../../opt/mozaik/$pkgname/$pkgname.amd64" "$pkgdir/usr/bin/$pkgname"
	cp -a "opt" "$pkgdir"
}

# vim: ts=2 sw=0 noet
