# Maintainer: budRich
# Contributor: budRich

pkgname=xwmplay
pkgver=0.1.2
pkgrel=1
pkgdesc='play with windowmanagers in xephyr, automatic screenresolution'
arch=('any')
url='https://github.com/budRich/xwmplay'
license=('BSD')
depends=('bash' 'xorg-server-xephyr' 'xorg-xrandr' 'xeventbind-git')
makedepends=('gawk')
_trgdir="$pkgname-$pkgver"
source=("${_trgdir}::$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('dfbf380afa56161fd9b8bba419b49d43d819fcc47f116e47b6ec274b1ef4ded9')

# sha256sums=('SKIP')
# url='file:///home/bud/git/bud/xwmplay'
# source=("${_trgdir}::git+$url")

package() {
  cd "$_trgdir"

  make DESTDIR="$pkgdir/" PREFIX=/usr
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
