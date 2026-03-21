# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=qtl-seq
_name=QTL-seq
pkgver=2.3.0
pkgrel=1
pkgdesc='Pipeline for bulk segregant analysis. https://doi.org/10.7717/peerj.13170'
arch=('x86_64')
url="https://github.com/YuSugihara/QTL-seq"
license=('GPL')
depends=(
         'bwa'
         'samtools'
         'snpeff'
         'bcftools'
         'trimmomatic'
         'python-matplotlib'
         'python-numpy'
         'python-pandas'
         'python-seaborn')
optdepends=('mutmap: identify causative mutations responsible for phenotype')
makedepends=(
            'python-setuptools'
            'cython'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=($_name-$pkgver::"https://github.com/YuSugihara/QTL-seq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('faa4a7c09238701d5dfe4b57c237c904d49519570ffce12c93b9229c1b4ca229')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
