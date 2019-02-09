# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2-dada2
_pkgname=q2-dada2
pkgver=2019.1.0
pkgrel=1
pkgdesc="QIIME 2 plugin wrapping DADA2"
arch=('any')
url="https://qiime2.org"
license=('BSD 3-Clause License')
depends=('python-qiime2' 'python-q2-types' 'python-biom-format' 'r-biobase' 'r-biocgenerics' 'r-biocparallel' 'r-biostrings' 'r-dada2' 'r-delayedarray' 'r-genomeinfodb' 'r-genomeinfodbdata' 'r-genomicalignments' 'r-genomicranges' 'r-iranges' 'r-rsamtools' 'r-s4vectors' 'r-shortread' 'r-summarizedexperiment' 'r-xvector' 'r-zlibbioc')
makedepends=('python-setuptools')
source=("https://github.com/qiime2/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2cebca1380ea03be53c3a485ed2fb95168cbea115c3dc851c7a02b5ad59a63ac')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
