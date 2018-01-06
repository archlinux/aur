# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: tardo <tardo@nagi-fanboi.net>

pkgname=clewn
pkgver=1.15
pkgrel=8
pkgdesc="gdb support for vim"
arch=('x86_64')
url="http://clewn.sourceforge.net"
license=('GPL')
depends=("gvim" "gdb")
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('dcfa989e6250109a7f0f99dc2d6db3e6')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  vimdir=/usr/share/vim/vimfiles ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/share/vim/vimfiles/doc/tags
}
