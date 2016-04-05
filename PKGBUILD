# Maintainer: Bruno Parmentier <dev@brunoparmentier.be>

pkgname=python-pyscard
_pyname=pyscard
pkgver=1.9.3
pkgrel=1
pkgdesc="Framework for building smart card aware applications in Python"
arch=('i686' 'x86_64')
url="http://pyscard.sourceforge.net/"
license=('LGPL')
depends=('python' 'pcsclite')
makedepends=('swig')
source=("https://pypi.python.org/packages/source/p/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('4ad45a56ddbf5d8b95c0832b4612c56b')

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py build_ext install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
