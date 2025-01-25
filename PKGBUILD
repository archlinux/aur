pkgname=abctab2ps
pkgver=1.9.0
pkgrel=1
pkgdesc="ABC notation editor"
groups=(abc)
depends=('gcc-libs' 'glibc')
source=(http://www.lautengesellschaft.de/cdmm/${pkgname}-${pkgver}.tar.gz)
url="http://www.lautengesellschaft.de/cdmm/"
sha256sums=('73626df0c73bb46f65a3097ee93e8105b64ce885e02d1047ba99df5afccdcde9')
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')

build() {
	cd $srcdir/$pkgname-$pkgver/src
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver/src
	mkdir -p $pkgdir/usr/bin
	make PREFIX="$pkgdir/usr" MANDIR="$pkgdir"/usr/share/man/man1 install

}
