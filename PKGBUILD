# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=capitaine-cursors-git
_pkgname=capitaine-cursors
pkgver=r2.r14.gfbb3887
pkgrel=1
pkgdesc="An x-cursor theme inspired by macOS and based on KDE Breeze (Git version)."
arch=('any')
url='https://github.com/keeferrourke/capitaine-cursors'
license=('LGPL3')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/keeferrourke/capitaine-cursors.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
	install -d "$pkgdir/usr/share/icons"
	cp -r "dist/" "$pkgdir/usr/share/icons/$pkgname"
	find $pkgdir -type f -exec chmod 644 {} \;
	find $pkgdir -type d -exec chmod 755 {} \;
}
