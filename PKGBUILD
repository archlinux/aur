#Submiter: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python-mmtf
pkgver=1.1.2
pkgrel=1
pkgdesc="The macromolecular transmission format (MMTF) is a binary encoding of biological structures."
url="http://mmtf.rcsb.org/"
license=("Apache")
arch=('x86_64')
depends=('python-numpy' 'python-nose' 'ipython' 'python-msgpack')


source=(https://github.com/rcsb/mmtf-python/archive/v$pkgver.tar.gz)
sha256sums=('289b1b46331d2011f5629bf3f0a7dbbf87ad24af301417edeb8c309cc86768d2')

build() {
  cd $srcdir/mmtf-python-$pkgver/
  python setup.py build
}

package(){
  cd $srcdir/mmtf-python-$pkgver/
  python setup.py install --root=$pkgdir --optimize=1
}
