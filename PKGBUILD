# Submiter: Hector Mtz-Seara (hseara#at#gmail#com)
# Contributor: Vedran Miletic <vedran AT miletic DOT net>

pkgname=python-gsd
pkgver=5.0.1
pkgrel=1
pkgdesc="GSD files store trajectories of the HOOMD-blue system state in a binary file with efficient random access to frames and allows all particle and topology properties to vary from one frame to the next."
url="https://github.com/glotzerlab/gsd/"
license=("BSD")
arch=('x86_64')
depends=('cython' 'python-numpy')


source=(https://github.com/glotzerlab/gsd/archive/v$pkgver.tar.gz)
sha256sums=('8838e87c5ddc2e2e1ca4420a0178ab117e0f3b30800514dad660602a0b98a0ce')

build() {
  cd $srcdir/gsd-$pkgver/
  python setup.py build
}

package(){
  cd $srcdir/gsd-$pkgver/
  python setup.py install --root=$pkgdir --optimize=1
}
