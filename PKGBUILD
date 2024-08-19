# Maintainer: <Guoyi Zhang> <myname at malacology dot net>
pkgname=getorganelle
pkgver=1.7.7.1
pkgrel=0
pkgdesc="Get organelle genomes from genome skimming data \
	 https://doi.org/10.1186/s13059-020-02154-5"
arch=('any')
url="https://github.com/Kinggerm/GetOrganelle"
license=('GPL-3.0-or-later')
depends=('python' 'perl' 'pigz' 'spades' 'onetbb' 'bowtie2' 'blast+' 'python-numpy' 'python-scipy' 'python-sympy' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cf8e14766de43967182be839de20c9d1709b60fae38a0b3d175742dfad7a5d44')

build() {
    cd "$srcdir/GetOrganelle-$pkgver"
    #python -m pip install . --no-deps --no-build-isolation -vvv --root="$pkgdir" --optimize=1
    python setup.py build
}

package() {
    cd "$srcdir/GetOrganelle-$pkgver"
    #install -Dm755 -t "$pkgdir/usr/bin" get_organelle_from_reads.py get_organelle_from_assembly.py slim_graph.py
    python setup.py install --root="$pkgdir" --optimize=1
}

