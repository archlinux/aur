#Submiter: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python-gsd
pkgver=3.2.0
pkgrel=1
pkgdesc="GSD files store trajectories of the HOOMD-blue system state in a binary file with efficient random access to frames and allows all particle and topology properties to vary from one frame to the next."
url="https://github.com/glotzerlab/gsd/"
license=("BSD")
arch=('x86_64')
depends=('cython' 'python-numpy')


source=(https://github.com/glotzerlab/gsd/archive/v$pkgver.tar.gz)
sha256sums=('5310387eaf9cc0b4f1eff83f44af1735709cc99be432a59d7b42c0052cbb3ade')

build() {
  cd $srcdir/gsd-$pkgver/
  python setup.py build
}

package(){
  cd $srcdir/gsd-$pkgver/
  python setup.py install --root=$pkgdir --optimize=1
}
