# Maintainer: aksr <aksr at t-com dot me>
pkgname=nref
pkgver=0.1
pkgrel=2
pkgdesc='A program for handling document references, it can be used as a troff preprocessor.'
arch=('i686' 'x86_64')
url='http://litcave.rudi.ir/'
license=('custom:BSD')
optdepends=('neatroff')
source=("http://litcave.rudi.ir/$pkgname.tar.gz")
md5sums=('12d2fd72a7af8757429abefe03ad4119')
sha1sums=('933e93975105d29b262fda1aad4f8eff0940ef45')
sha256sums=('6a3ea53ac353606a403077cac4737d979820a6d40d9c2cb9782df8283450d453')

build() {
	cd "$srcdir/$pkgname"
	make all
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 nref   $pkgdir/usr/bin/nref
	install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
}
