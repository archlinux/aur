# Contrinutor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=xsbench
pkgver=20
pkgrel=1
pkgdesc='Benchmark representing a key computational kernel of the Monte Carlo neutronics'
arch=('any')
url='https://github.com/ANL-CESAR/XSBench'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ANL-CESAR/XSBench/archive/v$pkgver.tar.gz")
md5sums=('acfea0b5fa2bda09596e689e24086e18')

build() {
	make -C XSBench-$pkgver/openmp-threading
}

package() {
	cd XSBench-$pkgver
	install -Dm755 openmp-threading/XSBench "$pkgdir/usr/bin/xsbench"
	install -Dm655 docs/XSBench_Theory.pdf "$pkgdir/usr/share/doc/xsbench/XSBench_Theory.pdf"
}
