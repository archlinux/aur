# Maintainer:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>
# Contributor:  Kozec (kozec-at-kozec-dot-com)
# Contributor: TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: LukenShiro <lukenshiro@ngi.it>

pkgname=python-pyfltk
_srcname='pyFltk'
pkgver=1.3.8
pkgrel=1
pkgdesc="A Python wrapper for the Fast Light Tool Kit library"
arch=('x86_64')
url="http://pyfltk.sourceforge.net/"
license=('LGPL')
depends=('fltk>=1.3.8' 'python>=3.8' 'glu')
makedepends=('swig>=4.0' 'python-setuptools')
source=("https://downloads.sourceforge.net/pyfltk/${_srcname}-${pkgver}.tar.gz")
sha1sums=('2d9bdb9fdfd5c8d96df19f98554445c6482a3da4')
#md5sums=('e6207435688023085bf57ac82fc5555a')

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py swig
  python setup.py build
  python setup.py install --root="${pkgdir}/" --optimize=1
}
