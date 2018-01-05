# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>

pkgname=synce-rra
pkgver=0.17
pkgrel=3
pkgdesc="provide a means of communication with a Windows CE device - rra libraries for synce"
arch=('x86_64')
url="http://synce.sourceforge.net/"
license=('GPL')
depends=('synce-core')
makedepends=('python2' 'pyrex' 'synce-libmimedir')
source=(http://downloads.sourceforge.net/synce/librra-$pkgver.tar.gz)
md5sums=('d0c869afbce4d203c85098a2886b6956')

build() {
  cd "$srcdir"/librra-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/librra-$pkgver
  make DESTDIR="$pkgdir" install
}
