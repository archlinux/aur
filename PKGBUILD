# Maintainer: SanskritFritz (gmail)

_gitname=meandmyshadow_levelpack_akos
pkgname=$_gitname-git
pkgver=2017.09.30
pkgrel=1
pkgdesc="Ákos level pack for the Me and my Shadow game"
arch=('any')
url='https://github.com/SanskritFritz/meandmyshadow_levelpack_akos'
license=('free')
depends=('meandmyshadow')
source=("$_gitname::git+https://github.com/SanskritFritz/meandmyshadow_levelpack_akos.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

package() {
	mkdir --parents "$pkgdir/usr/share/meandmyshadow/data/levelpacks/akos"
	cp "$srcdir"/$_gitname/{*.map,levels.lst} "$pkgdir/usr/share/meandmyshadow/data/levelpacks/akos/"
}

