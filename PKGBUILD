# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=mutmap
_name=MutMap
pkgver=2.3.3
_pkgver=2.3.3
pkgrel=1
pkgdesc='Pipeline for bulk segregant analysis. doi:10.7717/peerj.13170'
arch=('x86_64')
url="https://github.com/YuSugihara/MutMap"
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
         )
makedepends=(
            'python-setuptools'
            'cython'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=("https://github.com/YuSugihara/MutMap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b92ed579df1318e041a96af6a9e6d02d932c74ac6f8f167a58820558f39254b5')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  # no license mentioned on git page/journal
}
