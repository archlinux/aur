# Maintainer: Daniel Lima <danielmariodelima@gmail.com>

pkgname=xcursor-capitaine
conflicts=('xcursor-capitaine-git'
           'capitaine-cursors')
pkgver=2.1
pkgrel=1
pkgdesc='Capitaine Cursors - an x-cursor theme inspired by macOS and based on KDE Breeze'
arch=('any')
url='https://krourke.org/projects/art/capitaine-cursors'
license=('LGPLv3')
source=(git+https://github.com/keeferrourke/capitaine-cursors#tag=r2.1)
md5sums=('SKIP')

pkgver() {
	cd $srcdir/capitaine-cursors
	git describe --tags | sed 's/^r//'
}

package() {
	cd $srcdir/capitaine-cursors
	install -d $pkgdir/usr/share/icons/
	cp -pr $srcdir/capitaine-cursors/dist/ $pkgdir/usr/share/icons/capitaine-cursors
}

