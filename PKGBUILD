# Maintainer: budRich
# Contributor: budRich

pkgname=xwmplay
pkgver=0.1.4
pkgrel=1
pkgdesc='play with windowmanagers in xephyr, automatic screenresolution'
arch=('any')
url='https://github.com/budRich/xwmplay'
license=('BSD')
depends=('bash' 'xorg-server-xephyr' 'xorg-xrandr' 'xeventbind-git')
makedepends=('gawk')
_trgdir="$pkgname-$pkgver"
source=("${_trgdir}::$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('b7a47a258dc8927ed60e77f75d4fc46772eb93140da1d33e364d11da49f5b151')

# sha256sums=('SKIP')
# url='file:///home/bud/git/bud/xwmplay'
# source=("${_trgdir}::git+$url")

package() {
  cd "$_trgdir"

  make DESTDIR="$pkgdir/" PREFIX=/usr
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
