# Maintainer: pj1031999 <pj1031999@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: birdspider <nemora@gmx.at>
# Contributor: Igor Dejanovic <igor DOT dejanovic AT gmail DOT com>
pkgname=editra-svn
pkgver=78328
pkgrel=1
pkgdesc="multi-platform text editor with features that aid in code development - from svn"
arch=('any')
url="http://editra.org/"
license=('custom')
depends=('wxpython')
optdepends=('setuptools: needed if you want to use plugins')
source=(svn+http://svn.wxwidgets.org/svn/wx/wxPython/3rdParty/Editra editra.desktop)
md5sums=('SKIP'
         '6082f8d4bf1650af8ce87c6b3d38053b')
_svnmod=Editra

pkgver() {
  cd $srcdir/$_svnmod
  svnversion
}

package() {
  cd ${srcdir}/${_svnmod}
  python2 setup.py install --prefix=${pkgdir}/usr
}
