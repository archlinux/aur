# Maintainer:  Kozec (kozec-at-kozec-dot-com)
# Contributor: TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: LukenShiro <lukenshiro@ngi.it>

pkgname=python-pyfltk
_srcname='pyFltk'
pkgver=1.3.5
pkgrel=2
pkgdesc="A Python wrapper for the Fast Light Tool Kit library"
arch=('x86_64')
url="http://pyfltk.sourceforge.net/"
license=('LGPL')
depends=('fltk>=1.3.5' 'python>=3.7' 'glu')
makedepends=('swig>=3.0.12' 'python-setuptools')
source=("http://downloads.sourceforge.net/pyfltk/${_srcname}-${pkgver}.tar.gz"
        "pyFltk-1.3.5_swig_silence_warnings.patch"
        "pyFltk-1.3.5_python3.patch"
        "pyFltk-1.3.5_remove_percent_format.patch")
sha1sums=('1fb002aee91de0023241bd7c866dbc93cf1a3f5d'
          'f2b3256effe0d1be974395d4dc829d4313764122'
          '9ee31f66d8a6b5b750900c4d94121d381355922f'
          '44d34b64fbe8ee8ee0504d55888e208799f28d5d')
#md5sums=('5092df0e01b9719b8dd5a064ddc61600')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  patch -p2 -i "${srcdir}/pyFltk-1.3.5_swig_silence_warnings.patch"
  patch -p2 -i "${srcdir}/pyFltk-1.3.5_python3.patch"
  patch -p2 -i "${srcdir}/pyFltk-1.3.5_remove_percent_format.patch"
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
