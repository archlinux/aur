#Submiter: Hector Mtz-Seara (hseara#at#gmail#com)
pkgname=python-mmtf
pkgver=1.1.3
pkgrel=1
pkgdesc="The macromolecular transmission format (MMTF) is a binary encoding of biological structures."
url="http://mmtf.rcsb.org/"
license=("Apache")
arch=('x86_64')
depends=('python-numpy' 'python-nose' 'ipython' 'python-msgpack')


source=(https://github.com/rcsb/mmtf-python/archive/v$pkgver.tar.gz)
sha256sums=('777bcfe4c2dfc4810b78ff312d09d17dc0ed1bcc138cb7403e63e0a57285c6c9')

build() {
  cd $srcdir/mmtf-python-$pkgver/
  python setup.py build
}

package(){
  cd $srcdir/mmtf-python-$pkgver/
  python setup.py install --root=$pkgdir --optimize=1
}
