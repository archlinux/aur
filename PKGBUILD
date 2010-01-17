# $Id: $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: sxe <sxxe@gmx.de>

pkgname=kuickshow
pkgver=0.9.1
pkgrel=1
_kdever=4.3.1
pkgdesc="A very fast and convenient image viewer"
url="http://userbase.kde.org/KuickShow"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'imlib' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'cmake' 'automoc4')
install=kuickshow.install
source=(http://downloads.kde.org/stable/${_kdever}/src/extragear/${pkgname}-${pkgver}-kde${_kdever}.tar.bz2)
md5sums=('7c5d9fa34e9df5b91e79af42e0256fdc')

build() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver}-kde${_kdever} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
