# Maintainer: Andrew Webley <UnsuspectingHero@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=imdb-thumbnailer
pkgver=0.8.8
pkgrel=4
arch=('any')
license=('GPL')
pkgdesc="A nautilus / thunar video thumbnailer that sets film covers as thumbnails"
install=$pkgname.install
url="https://launchpad.net/$pkgname"
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname.$pkgver.tar)
md5sums=('2664a3301260a84f171c911dc65da8a0')
optdepends=('nautilus: to view thumbnails with'
			'thunar: to view thumbnails with')
prepare(){
	sed -i '338s/configFile/desktopFile/' "$srcdir/package/usr/bin/$pkgname"
}
package(){
    install -Dm 755 $srcdir/package/usr/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 $srcdir/package/usr/local/share/thumbnailers/imdb.desktop "$pkgdir/usr/share/applications/imdb.desktop"
}
