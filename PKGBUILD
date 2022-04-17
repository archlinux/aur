# Maintainer: lemm1 <mrlolvovgres@gmail.com>

pkgname=nozbe
pkgver=3.19.0
pkgrel=1
pkgdesc="To-do, task, project and time management application."
url="https://nozbe.com"
arch=(x86_64)
license=(custom)
depends=(
	alsa-lib gconf gtk3 libxss nss
)
source=(
	"https://files.nozbe.com/linux/linux64_newest.tar.gz"
	"Nozbe.desktop"
)
sha256sums=(
	"f79990e23ed9a045ec42e6c2bb5c00a33d0ce89adb7d55245481780c30d053d5"
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
