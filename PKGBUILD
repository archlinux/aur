# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jamovi-rbundle
pkgver=1
pkgrel=1
epoch=
pkgdesc="R Bundle for Jamovi"
arch=('any')
url=""
license=('GPL')
depends=('r')
makedepends=('nodejs' 'r')
source=("rbundle.R"
        )
noextract=()
md5sums=('a4e28de7c48767ca7836dd778c5ba502')
validpgpkeys=()

build() {
	# jmvcore
	cd $srcdir
	mkdir -p base/R
	Rscript $srcdir/rbundle.R $srcdir/base/R
}

package() {
	mkdir -p $pkgdir/usr/lib/jamovi/Resources/modules
	cp -r $srcdir/base $pkgdir/usr/lib/jamovi/Resources/modules/
}
