# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python2-cjuman
pkgver=0.1.0
pkgrel=4
pkgdesc="A Python bindings of JUMAN, A Japanese Morphological Analyzer"
url="http://app-dist.khlog.net/software/python-cjuman/"
arch=('i686' 'x86_64')
license=('unknown')
depends=('juman' 'git' 'python2')

# this PKGBUILD uses cJuman installer (https://github.com/chezou/cJuman-installer) .
source=('git+https://github.com/chezou/cJuman-installer.git')
_pkgname="cJuman-installer"
sha1sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgname}
 
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}

  python2 setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
