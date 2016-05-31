# Maintainer: Bruno Parmentier <dev@brunoparmentier.be>

pkgname=python-pyscard
_pyname=pyscard
pkgver=1.9.4
pkgrel=1
pkgdesc="Framework for building smart card aware applications in Python"
arch=('i686' 'x86_64')
url="http://pyscard.sourceforge.net/"
license=('LGPL')
depends=('python' 'pcsclite')
makedepends=('swig')
source=("https://pypi.python.org/packages/a0/59/05e00160d4a386502b60bfcc7591e0443561306b9ca1954bca841692014a/$_pyname-$pkgver.tar.gz")
md5sums=('55c08be4aea72ac411feeb52b13b9ba2')

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py build_ext install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
