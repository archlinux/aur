# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

pkgname=nozbe
pkgver=3.9.2
pkgrel=1
pkgdesc="To-do, task, project and time management application."
url="https://nozbe.com"
arch=(x86_64)
license=(custom)
depends=(
	alsa-lib freetype2 gconf gtk2 libxss libxtst nss
)
source=(
	"https://files.nozbe.com/linux/linux64_newest.tar.gz"
	"Nozbe.desktop"
)
sha256sums=(
	"16514f4cb715dfb8f4cafb6ed315fd514d63411d1316905f30ce62b8dc34177a"
	"1d3d5ac6354d705ea467942732f2a60aa7c2eda86cf0d65da7026f98c69e3c63"
)

package()
{
	mkdir -p "$pkgdir/opt/Nozbe" "$pkgdir/usr/share/applications" "$pkgdir/usr/bin"

	cp -R "$srcdir/Nozbe-$pkgver/"* "$pkgdir/opt/Nozbe/"
	cp "$srcdir/Nozbe.desktop" "$pkgdir/usr/share/applications/"

	ln -s "/opt/Nozbe/Nozbe" "$pkgdir/usr/bin/Nozbe"
	ln -s "/opt/Nozbe/Nozbe" "$pkgdir/usr/bin/nozbe"
}
