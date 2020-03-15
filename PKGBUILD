# Contrinutor: Anton Leontiev <bunder /at/ t-25.ru>

pkgname=xsbench
pkgver=19
pkgrel=1
pkgdesc='Benchmark representing a key computational kernel of the Monte Carlo neutronics'
arch=('any')
url='https://github.com/ANL-CESAR/XSBench'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ANL-CESAR/XSBench/archive/v$pkgver.tar.gz")
md5sums=('07ca7cbf4fa4a479fb1f429e06e4019b')

build() {
	make -C XSBench-$pkgver/openmp-threading
}

package() {
	cd XSBench-$pkgver
	install -Dm755 openmp-threading/XSBench "$pkgdir/usr/bin/xsbench"
	install -Dm655 docs/XSBench_Theory.pdf "$pkgdir/usr/share/doc/xsbench/XSBench_Theory.pdf"
}
