# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

pkgname=nozbe
pkgver=3.8.0
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
	"fe34ec7c54a659e9a727ea4ddaf4a378f60e3ffb374b5697bb8b68ba521e2ae0"
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
