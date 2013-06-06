# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-pybindgen
pkgver=0.15.0
pkgrel=2
pkgdesc="A tool to generate Python bindings for C/C++ code"
url="http://pypi.python.org/pypi/PyBindGen"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python2')
makedepends=('python-waf')
backup=()
install=
source=(http://pybindgen.googlecode.com/files/pybindgen-${pkgver}.zip)
md5sums=('e4c8b4e68c32216b3deda510e7fb2ebb')

build() {
  cd $startdir/src/pybindgen-$pkgver
  PYTHON=python2 python2 ./waf configure --prefix=/usr || return 1
  PYTHON=python2 python2 ./waf || return 1
  PYTHON=python2 python2 ./waf install --prefix=/usr --destdir=$startdir/pkg || return 1
}
