# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
# Contributor: Christopher Billington <chrisjbillington@gmail.com>
pkgname=finesse
pkgver=2.3.1
pkgrel=3
pkgdesc="FINESSE: Frequency domain INterfErometer Simulation SoftwarE"
license=("GPL3")
url="http://gwoptics.org/finesse"
optdepends=('gnuplot: for test_plot.kat example')
source=("git+https://git.ligo.org/$pkgname/$pkgname")
sha256sums=('SKIP')
arch=('any')

build() {
	cd $srcdir/$pkgname
	./finesse.sh --build
}

package() {
	cd $srcdir/$pkgname
	install -Dm755 kat "${pkgdir}/usr/bin/kat"
	install -Dm644 kat.ini "${pkgdir}/etc/finesse"
	install -Dm644 test.kat "${pkgdir}/usr/share/finesse/samples/test.kat"
	install -Dm644 test.kat "${pkgdir}/usr/share/finesse/samples/test_plot.kat"
}
