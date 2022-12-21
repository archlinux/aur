# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=qtl-seq
_name=QTL-seq
pkgver=2.2.3
_pkgver=2.2.3
pkgrel=1
pkgdesc='Pipeline for bulk segregant analysis. doi:10.7717/peerj.13170'
arch=('x86_64')
url="https://github.com/YuSugihara/QTL-seq"
license=('unknown')
depends=(
         'bwa'
         'samtools'
         'snpeff'
         'bcftools'
         'trimmomatic'
         'python-matplotlib'
         'python-numpy'
         'python-pandas'
         'python-seaborn'
         'mutmap')
makedepends=(
            'python-setuptools'
            'cython'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=("https://github.com/YuSugihara/QTL-seq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb6e641f100316cd178254fc1f196cc5dd7bbebb18f2997c29cd896a997227d1')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  # no license mentioned on git page/journal
}
