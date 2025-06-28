# Submiter: Hector Mtz-Seara (hseara#at#gmail#com)
# Contributor: Vedran Miletic <vedran AT miletic DOT net>

pkgname=python-gsd
pkgver=4.0.0
pkgrel=1
pkgdesc="GSD files store trajectories of the HOOMD-blue system state in a binary file with efficient random access to frames and allows all particle and topology properties to vary from one frame to the next."
url="https://github.com/glotzerlab/gsd/"
license=("BSD")
arch=('x86_64')
depends=('cython' 'python-numpy')


source=(https://github.com/glotzerlab/gsd/archive/v$pkgver.tar.gz)
sha256sums=('9bdfe76da0578aa662c7428d09a995dd3e19177dfe5dee32e4286697f978eb31')

build() {
  cd $srcdir/gsd-$pkgver/
  python setup.py build
}

package(){
  cd $srcdir/gsd-$pkgver/
  python setup.py install --root=$pkgdir --optimize=1
}
