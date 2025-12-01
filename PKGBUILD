# Maintainer:  Robert Arkiletian <robark*gmail>
# Contributor:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>
# Contributor:  Kozec (kozec-at-kozec-dot-com)
# Contributor: TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: LukenShiro <lukenshiro@ngi.it>

pkgname=python-pyfltk
_srcname='pyfltk'
pkgver=1.4.4.0
pkgrel=1
pkgdesc="A Python wrapper for the Fast Light Tool Kit library"
arch=('x86_64')
url="https://pyfltk.sourceforge.io"
license=('LGPL-2.0-only')
depends=('fltk>=1.4.4' 'python>=3.13')
makedepends=('swig>=4.4' 'python-setuptools')
source=("https://downloads.sourceforge.net/pyfltk/${_srcname}-${pkgver}.tar.gz")
sha1sums=('1a8877dba50d1cb213dbd9228f62b0cb5c05ce0c')

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py swig
  python setup.py build
  python setup.py install --root="${pkgdir}/" --optimize=1
}


