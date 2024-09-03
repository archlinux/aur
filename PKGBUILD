# Maintainer: <Guoyi Zhang> <myname at malacology dot net>
pkgname=mitos
_pkgname=MITOS
pkgver=2.1.9
pkgrel=0
pkgdesc="Improved de novo metazoan mitochondrial genome annotation \
	 https://doi.org/10.1016/j.ympev.2012.08.023"
arch=('any')
url="https://gitlab.com/Bernt/MITOS"
license=('GPL-3.0-or-later')
depends=('r-ggplot' 'r-reshape2' 'viennarna' 'blast+' 'hmmer'
	  'python-reportlab' 'pyton-pillow' 'libtiff' 'java-environment' 'python-biopython')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/MITOS-$pkgver.tar.gz")
sha256sums=('cf8e14766de43967182be839de20c9d1709b60fae38a0b3d175742dfad7a5d44')

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
