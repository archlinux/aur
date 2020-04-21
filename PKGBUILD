# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
# Contributor: Christopher Billington <chrisjbillington@gmail.com>
pkgname=finesse
pkgver=2.3.1
pkgrel=1
pkgdesc="FINESSE: Frequency domain INterfErometer Simulation SoftwarE"
license=("GPL3")
url="http://gwoptics.org/finesse"
optdepends=('gnuplot: for test_plot.kat example')
source=("https://git.ligo.org/$pkgname/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('97ccffc3af494d32fa47edb4792283ef3101f8476c0c23ff82f266b767737cdd')
arch=('any')

build() {
	cd $srcdir/$pkgname-$pkgver
	./finesse.sh --build
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm755 kat "${pkgdir}/usr/bin/kat"
	install -Dm644 kat.ini "${pkgdir}/etc/finesse"
	install -Dm644 test.kat "${pkgdir}/usr/share/finesse/samples/test.kat"
	install -Dm644 test.kat "${pkgdir}/usr/share/finesse/samples/test_plot.kat"
}
