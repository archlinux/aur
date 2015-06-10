# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=tiddlywiki
pkgver=5.1.9
pkgrel=1
pkgdesc='Personal wiki where everything is in one html-file'
arch=('x86_64' 'i686')
url='http://www.tiddlywiki.com/'
license=('BSD')
depends=('xdg-utils')
source=('http://www.tiddlywiki.com/empty.html'
        'tiddlywiki.py')
sha256sums=('e46433f77d69cf7ee0849499f92a31be1703c09f3898c15fe12bd230a3a4b8af'
            'de87f833dec4d1bf7c352b89bbab55d6974ea69026cb42269d59fec65e727625')

build() {
  cat empty.html | head -39 | tail -29 > COPYING
}

package() {
  install -d "$pkgdir/usr/share/tiddlywiki"
  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 empty.html "$pkgdir/usr/share/tiddlywiki/empty.html"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
