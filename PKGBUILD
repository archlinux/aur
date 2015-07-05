# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=tiddlywiki
pkgver=5.1.9
pkgrel=2
pkgdesc='Personal wiki where everything is in one html-file'
arch=('i686' 'x86_64')
url='http://www.tiddlywiki.com/'
license=('BSD')
depends=('xdg-utils')
source=('http://www.tiddlywiki.com/empty.html'
        'tiddlywiki.py')
sha256sums=('358a86bba47deec636142ceaa0a6a3231bd8f250a96d90435617dccb05bd13c9'
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
