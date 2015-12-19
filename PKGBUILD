# Contributor:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kotyz <kotyz.king@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tkimg
pkgver=1.4.2
_pkgver=1.4
pkgrel=1
pkgdesc="This package enhances Tk, adding support for many other Image formats: BMP, XBM, XPM, GIF, PNG, JPEG, TIFF and postscript."
url="http://tkimg.sourceforge.net"
arch=('i686' 'x86_64')
license=('BSD')
depends=('zlib' 'libjpeg' 'libpng' 'libtiff' 'tcl' 'tk' 'tcllib')
source=(http://downloads.sourceforge.net/tkimg/$pkgname$pkgver.tar.gz)
md5sums=('c42b46692a55c402c97e8f2a896bc2d4')

build() {
  cd "${srcdir}/${pkgname}${_pkgver}"
  make distclean
  ./configure --prefix=/usr --exec-prefix=/usr
  make all || return 1
}

package() {
  cd "${srcdir}/${pkgname}${_pkgver}"
  make INSTALL_ROOT="$pkgdir" install
}
