# Maintainer: Jose Riha <jose1711 gmail com>

_pkgbase=gnome-python-extras
pkgname=python2-gtkhtml2
pkgver=2.25.3
pkgrel=14
arch=('i686' 'x86_64')
url="http://www.daa.com.au/~james/pygtk/"
license=('GPL' 'LGPL')
makedepends=('gtkspell' 'libgnomeui' 'python2' 'pygtk' 'gnome-python')
source=(http://ftp.gnome.org/pub/gnome/sources/gnome-python-extras/2.25/gnome-python-extras-${pkgver}.tar.bz2
	gnome-python-extras-2.25.3-update-for-2.27.2.patch)
md5sums=('9f3b7ec5c57130b96061cb486b79c076' '0b0a4d93016d14f2306682301de3bda3')
sha1sums=('e69e5288466c960ed6f985bb10c9969b21ed85a4' 'b065efb7f7f5baa7b95b63bcadb6a4623d1bc9e5')

prepare() {
  cd $_pkgbase-$pkgver
  patch -Np1 -i ../gnome-python-extras-2.25.3-update-for-2.27.2.patch
}
    
build() {
  cd $_pkgbase-$pkgver
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --disable-egg --disable-gksu --enable-gtkhtml2 --disable-gksu2 --disable-gksuui
  make
}

package() {
  cd $_pkgbase-$pkgver
  make -C gtkhtml2 install DESTDIR="${pkgdir}"
}
