# Maintainer: JC Francois <jc.francois@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=tiddlywiki
pkgver=5.1.20
pkgrel=1
pkgdesc='Personal wiki where everything is in one html-file'
arch=('i686' 'x86_64')
url='http://www.tiddlywiki.com/'
license=('BSD')
depends=('xdg-utils')
source=('http://www.tiddlywiki.com/empty.html'
        'tiddlywiki.py')
sha256sums=('01620956cce3e027fafa61a8474c208891c09c3403b1eb15a5b0ebdbbf67a54f'
            'f0795f66b4ceb7b222b8ac68f39fd75625bd13b2af56f852342d172707db49f9')

build() {
  cat empty.html | head -45 | tail -28 > COPYING
}

package() {
  install -d "$pkgdir/usr/share/tiddlywiki"
  install -Dm755 "tiddlywiki.py" "$pkgdir/usr/bin/tiddlywiki"
  install -Dm644 empty.html "$pkgdir/usr/share/tiddlywiki/empty.html"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
