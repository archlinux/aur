# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Pavel Borzenkov <pavel.borzenkov@gmail.com>

pkgname=tksystray
pkgver=0.1
pkgrel=7
pkgdesc="tksystray is compatible with freedesktop.org standards systray for Tk"
arch=('x86_64')
url="http://tkabber.jabber.ru/tksystray"
license=("GPL")
depends=(tcl tk imlib)
source=(https://sources.archlinux.org/other/community/tksystray/tksystray_$pkgver.orig.tar.gz)
md5sums=('d1784d2f786304bd6eaa82512fd5cf1c')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --with-tcl=/usr/lib --with-tk=/usr/lib
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/lib/$pkgname-$pkgver
  cp -rf libtray.so "$pkgdir"/usr/lib/$pkgname-$pkgver
  cp -rf pkgIndex.tcl "$pkgdir"/usr/lib/$pkgname-$pkgver
}
