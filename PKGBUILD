# Maintainer: budRich
# Contributor: budRich

pkgname=xwmplay
pkgver=0.1.5
pkgrel=1
pkgdesc='play with windowmanagers in xephyr, automatic screenresolution'
arch=('any')
url='https://github.com/budRich/xwmplay'
license=('BSD')
depends=('bash' 'xorg-server-xephyr' 'xorg-xrandr' 'xeventbind-git')
makedepends=('gawk')
_trgdir="$pkgname-$pkgver"
source=("${_trgdir}::$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('84f1e04283db3e7c0b0f0cc51b5e982a0e18f9a838c3128b717cfead0ffbc4cd')

# sha256sums=('SKIP')
# url='file:///home/bud/git/bud/xwmplay'
# source=("${_trgdir}::git+$url")

package() {
  cd "$_trgdir"

  make DESTDIR="$pkgdir/" PREFIX=/usr
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
