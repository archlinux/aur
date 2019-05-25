# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-rgt
_pkgname=reg-gen
pkgver=0.12.1
pkgrel=1
pkgdesc="Regulatory Genomics Toolbox"
arch=('any')
url=http://www.regulatory-genomics.org
license=('custom')
depends=('python' 'python-numpy' 'python-scipy' 'python-pysam' 'python-pybigwig' 'python-pyvcf' 'python-natsort' 'python-matplotlib' 'python-scikit-learn' 'python-matplotlib-venn' 'python-mpmath' 'python-htseq' 'python-hmmlearn' 'python-pyx' 'python-moods' 'python-fisher' 'python-biopython')
makedepends=('python-setuptools')
source=("https://github.com/CostaLab/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('baccb00d00dd98a26954414f13fd6f8f7d4ac1f6b40d65177867237029477fcf')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's,pyBigWig==,pyBigWig>=,g' setup.py
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
