#Submiter: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python-gsd
pkgver=2.5.1
pkgrel=1
pkgdesc="GSD files store trajectories of the HOOMD-blue system state in a binary file with efficient random access to frames and allows all particle and topology properties to vary from one frame to the next."
url="https://github.com/glotzerlab/gsd/"
license=("BSD")
arch=('x86_64')
depends=('cython' 'python-numpy')


source=(https://github.com/glotzerlab/gsd/archive/v$pkgver.tar.gz)
sha256sums=('1aff7f078b913bfd497c063bac941757b62462110cd69e63527db0b103cf8314')

build() {
  cd $srcdir/gsd-$pkgver/
  python setup.py build
}

package(){
  cd $srcdir/gsd-$pkgver/
  python setup.py install --root=$pkgdir --optimize=1
}
