# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=thunarx-python-0.3
_pkgname=thunarx-python
pkgver=0.3.0
pkgrel=1
pkgdesc="Thunarx python bindings, legacy version for Thunar Gtk2"
arch=('i686' 'x86_64')
url="http://rabbitvcs.org/"
depends=('python2' 'thunar>=0.4.0' 'pygtk>=2.6.0' 'python2-gobject2')
provides=('thunarx-python')
conflicts=('thunarx-python')
license=('GPL')
source=("http://archive.xfce.org/src/bindings/thunarx-python/0.3/${_pkgname}-${pkgver}.tar.bz2" 'python2.patch')
md5sums=('86a28c4c34cae534f2793133b4755794'
         '6144a91d626ad14b52723edc471369c2')
build(){
  cd "${srcdir}"/${_pkgname}-${pkgver}
  patch -p1 -i $srcdir/python2.patch
  PYTHON=python2 ./configure
  make
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

