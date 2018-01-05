# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>

pkgname=qucs
pkgver=0.0.19
pkgrel=1
pkgdesc="An integrated circuit simulator with a graphical user interface"
arch=('x86_64')
url="http://qucs.sourceforge.net"
license=('GPL')
depends=('gcc-libs' 'qt4' 'adms')
makedepends=('gperf')
optdepends=('freehdl: to permit digital circuit simulation'
#	    'asco: to enable circuit optimization'
	    'perl')
source=("http://downloads.sourceforge.net/project/qucs/qucs/$pkgver/qucs-$pkgver.tar.gz")
sha256sums=('45c6434fde24c533e63550675ac21cdbd3cc6cbba29b82a1dc3f36e7dd4b3b3e')

build() {
  cd "$srcdir"/$pkgname-${pkgver/s/.}
  ./configure --prefix=/usr --disable-doc
  make RCC=/usr/bin/rcc-qt4
}

package() {
  cd "$srcdir"/$pkgname-${pkgver/s/.}
  make DESTDIR="$pkgdir" install
}
