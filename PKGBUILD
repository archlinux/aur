# Maintainer:  Robert Arkiletian <robark*gmail>
# Contributor:  Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>
# Contributor:  Kozec (kozec-at-kozec-dot-com)
# Contributor: TDY <tdy@gmx.com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: LukenShiro <lukenshiro@ngi.it>

pkgname=python-pyfltk
_srcname='pyfltk'
pkgver=1.4.5.0
pkgrel=1
pkgdesc="A Python wrapper for the Fast Light Tool Kit library"
arch=('x86_64')
url="https://pyfltk.sourceforge.io"
license=('LGPL-2.0-only')
depends=('fltk>=1.4.5' 'python>=3.13')
makedepends=('swig>=4.4' 'python-setuptools' 'python-build' 'python-installer')
source=("https://downloads.sourceforge.net/pyfltk/${_srcname}-${pkgver}.tar.gz")
sha1sums=('8dd8bcd17a31297f3a10ac01127f4a880b3d648d')

build(){
  cd "${srcdir}/${_srcname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python -m installer --destdir="${pkgdir}/" dist/*.whl
}


