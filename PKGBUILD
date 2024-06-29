# Maintainer: JC Francois <jc.francois@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=tiddlywiki
pkgver=5.3.4
pkgrel=1
pkgdesc='Personal wiki where everything is in one html-file'
arch=('i686' 'x86_64')
url='http://www.tiddlywiki.com/'
license=('BSD')
depends=('xdg-utils')
source=('http://www.tiddlywiki.com/empty.html'
        'tiddlywiki.py')
md5sums=('0822a64a539d8e5def3801dccc6d0cce'
         '219c3db3c4be8d359d3c18e96b171ee3')

build() {
  cat empty.html | head -45 | tail -28 > COPYING
}

package() {
  install -d "$pkgdir/usr/share/tiddlywiki"
  install -Dm755 "tiddlywiki.py" "$pkgdir/usr/bin/tiddlywiki"
  install -Dm644 empty.html "$pkgdir/usr/share/tiddlywiki/empty.html"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
