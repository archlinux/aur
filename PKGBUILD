# Maintainer: Crablet <love4uandgzfc@gmail.com>
# Contributor: Crablet <love4uandgzfc@gmail.com>

pkgname=kurso-de-esperanto-kape
pkgver=5.1.1
pkgrel=1
pkgdesc="A multimedia computer program for teaching yourself Esperanto"
arch=('x86_64')
depends=('qt5-multimedia')
url="http://kurso.com.br/"
license=('GPL3')
source=("http://kurso.com.br/kurso_x86_64.tar.gz")
md5sums=('ed6cc642b8c7b368516b871377b5af4d')

package()
{
	mkdir -p $pkgdir/usr/share/kurso
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/pixmaps
	
	cp -r $srcdir/kurso_x86_64/* $pkgdir/usr/share/kurso
	ln -s -r $pkgdir/usr/share/kurso/kursokape $pkgdir/usr/bin/kursokape
	install -Dm644 $srcdir/kurso_x86_64/kurso_256.png $pkgdir/usr/share/pixmaps/kurso_256.png
	sed -i '/Icon/s/kurso_256/\/usr\/share\/pixmaps\/kurso_256.png/g' $srcdir/kurso_x86_64/kursokape.desktop.desktop   # Icon=kurso_256 -> Icon=/usr/share/pixmaps/kurso_256.png
	install -Dm744 $srcdir/kurso_x86_64/kursokape.desktop.desktop $pkgdir/usr/share/applications/kursokape.desktop
}
