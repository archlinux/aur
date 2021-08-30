# Maintainer:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>
# Contributor:  Kozec (kozec-at-kozec-dot-com)
# Contributor: TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: LukenShiro <lukenshiro@ngi.it>

pkgname=python-pyfltk
_srcname='pyFltk'
pkgver=1.3.7
pkgrel=1
pkgdesc="A Python wrapper for the Fast Light Tool Kit library"
arch=('x86_64')
url="http://pyfltk.sourceforge.net/"
license=('LGPL')
depends=('fltk>=1.3.7' 'python>=3.8' 'glu')
makedepends=('swig>=4.0' 'python-setuptools')
source=("https://downloads.sourceforge.net/pyfltk/${_srcname}-${pkgver}.tar.gz")
sha1sums=('0aa7f9e5f8aa06861936d0d5c6193d200cac31a2')
#md5sums=('695ef2e36c4ba87a8d66e2b27298192f')

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py swig
  python setup.py build
  python setup.py install --root="${pkgdir}/" --optimize=1
}
