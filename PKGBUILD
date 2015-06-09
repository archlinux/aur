# Maintainer: bitwave <aur [at] oomlude [dOT] de>
pkgname=ditaa-eps
pkgver=0.2
pkgrel=1
pkgdesc="Same as ditaa, but converts output to scalable EPS graphics. Great in LaTeX ;-)"
arch=(any)
url="http://ditaa-addons.sourceforge.net/"
license=('GPL')
groups=(office)
depends=("bash" "java-environment")
provides=("ditaa-eps")
conflicts=("ditaa-eps")
source=(ditaa-eps "http://downloads.sourceforge.net/ditaa-addons/DitaaEps-0_2.zip")
md5sums=('3730b3b7300f4d16dd77be9605c25c4d'
         '5eeff234aadf31728f96f6c56cbba0a8')

package() {
	cd "$srcdir/DitaaEps"
	mkdir -p $pkgdir/usr/share/java/$pkgname
	install -Dm 644 ditaa0_6b.jar $pkgdir/usr/share/java/$pkgname/
	install -Dm 644 DitaaEps.jar $pkgdir/usr/share/java/$pkgname/
	install -Dm 755 $srcdir/ditaa-eps $pkgdir/usr/bin/ditaa-eps
}
