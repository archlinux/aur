# Maintainer: Jaroslav Janukevic (janukevic <at> gmail <dot> com)
# Contributor: Rick Rein <jeebusroxors@gmail.com>
# Contributor: samuellittley <supersam.littley@gmail.com>
pkgname=xprintidle
pkgver=0.2
pkgrel=6
pkgdesc="Print X idle time"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxss')
url=(http://www.dtek.chalmers.se/~henoch/text/xprintidle.html)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/xprintidle_$pkgver.orig.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export LIBS=-lXext
  ./configure --prefix=/usr --x-libraries=/usr/lib
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" "libexecdir=$pkgdir/usr/bin" install
}

md5sums=('254071bee32447566be4a4f42b9a19ff')
