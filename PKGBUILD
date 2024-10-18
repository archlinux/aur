# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=mutmap
_name=MutMap
pkgver=2.3.8
pkgrel=1
pkgdesc='Pipeline to identify causative mutations responsible for a phenotype. https://doi.org/10.7717/peerj.13170'
arch=('x86_64')
url="https://github.com/YuSugihara/MutMap"
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
         'python-seaborn'
         )
makedepends=(
            'python-setuptools'
            'cython'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=($_name-$pkgver::"https://github.com/YuSugihara/MutMap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a0883ceb4fc0bbd4b19ccc65bcbff349d89d2a8db8732e5ef2e0d8dade5b595')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
