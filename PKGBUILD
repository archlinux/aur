# Contrinutor: Anton Leontiev <bunder /at/ t-25.ru>

pkgname=xsbench
pkgver=14
pkgrel=1
pkgdesc='Benchmark representing a key computational kernel of the Monte Carlo neutronics'
arch=('any')
url='https://github.com/ANL-CESAR/XSBench'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ANL-CESAR/XSBench/archive/v$pkgver.tar.gz")
md5sums=('94d5d28eb031fd4ef35507c9c1862169')

build() {
	make -C XSBench-$pkgver/src
}

package() {
	cd XSBench-$pkgver
	install -Dm755 src/XSBench "$pkgdir/usr/bin/xsbench"
	install -Dm655 docs/XSBench_Theory.pdf "$pkgdir/usr/share/doc/xsbench/XSBench_Theory.pdf"
	install -Dm655 README.txt "$pkgdir/usr/share/doc/xsbench/README.txt"
}
