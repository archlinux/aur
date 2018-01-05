# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>

pkgname=libmatchbox
pkgver=1.12
pkgrel=1
pkgdesc="Base library for Matchbox WM"
arch=('x86_64')
license=('LGPL')
depends=('pango' 'libpng' 'libjpeg>=7' 'xsettings-client' 'libxext')
url="http://matchbox-project.org/"
source=("http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/snapshot/libmatchbox-$pkgver.tar.bz2")
sha256sums=('5c7795e46c24d848a2b960f3b994911165d95e5d5731e39105ee0d808d2373eb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --enable-pango --enable-jpeg --enable-xsettings
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
