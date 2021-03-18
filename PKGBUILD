# Maintainer: Diab Neiroukh <lazerl0rd at thezest dot dev>

pkgname="layan-cursor-theme-git"
pkgver="r2.7a37de2"
pkgrel=1
epoch=2
arch=("any")
pkgdesc="A x-cursor theme inspired by the Layan GTK Theme and based on Capitaine Cursors."
url="https://github.com/vinceliuice/Layan-cursors"
license=(
	"GPL3"
)
makedepends=(
	"git"
)
provides=(
	"layan-cursor-theme"
)
source=(
	"git+$url.git"
)
b2sums=(
	"SKIP"
)

pkgver()
{
	cd "Layan-cursors"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
	install -d "$pkgdir/usr/share/icons"
	cd "Layan-cursors"
	cp -r "dist" "$pkgdir/usr/share/icons/Layan-cursors"
	cp -r "dist-border" "$pkgdir/usr/share/icons/Layan-border-cursors"
	cp -r "dist-white" "$pkgdir/usr/share/icons/Layan-white-cursors"
}
