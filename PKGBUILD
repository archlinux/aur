# $Id: PKGBUILD 9978 2008-08-21 12:43:50Z allan $
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>

pkgname=yabasic
pkgver=2.768
pkgrel=1
pkgdesc="Yet Another Basic"
arch=('i686' 'x86_64')
license=('GPL2' 'custom:Artistic')
url="http://www.yabasic.de/"
depends=('libx11' 'libsm' 'ncurses')
makedepends=('libxt')
source=("http://www.yabasic.de/download/$pkgname-$pkgver.tar.gz")
md5sums=('394731d85d5188ae0020bf876fb71230')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {

  cd $srcdir/$pkgname-$pkgver
  make prefix="${pkgdir}/usr" install
  install -Dm644 ARTISTIC ${pkgdir}/usr/share/licenses/yabasic/Artistic
}



