# Maintainer: <Guoyi Zhang> <myname at malacology dot net>
pkgname=mitos
_pkgname=MITOS
pkgver=2.1.9
pkgrel=1
pkgdesc="Improved de novo metazoan mitochondrial genome annotation \
	 https://doi.org/10.1016/j.ympev.2012.08.023"
arch=('any')
url="https://gitlab.com/Bernt/MITOS"
license=('MIT')
depends=('r-ggplot2' 'r-reshape2' 'viennarna' 'blast+' 'hmmer' 
	'python-ete3'
	  'python-reportlab' 'python-pillow' 'libtiff' 'java-environment' 'python-biopython')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/MITOS-$pkgver.tar.gz")
sha256sums=('6c580102388077dc413d8a28cb0361aac1df10ad4c8ade49aa710d018a90fdd0')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    #python -m pip install . --no-deps --no-build-isolation -vvv --root="$pkgdir" --optimize=1
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    #install -Dm755 -t "$pkgdir/usr/bin" get_organelle_from_reads.py get_organelle_from_assembly.py slim_graph.py
    python setup.py install --root="$pkgdir" --optimize=1
}
