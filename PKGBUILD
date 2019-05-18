# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: mock
pkgname=ttf-nishiki-teki
pkgver=3.51h
pkgrel=1
pkgdesc='Unicode-based font inspired by a free shell of Ukagaka called “Nishiki”'
arch=('any')
url='http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki.htm'
license=('custom')
source=("$pkgname-v$pkgver.zip::http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki.zip"
        "LICENSE")
sha512sums=('205f8db011773847bbfe8f58085824b6378e68bc36b9c9240bae6795bf6beef4e24de2fcd780d2f7c7cc0264c4d947a83e300ed7ee8b9476ff28d7099ed1deb2'
            'f6138f41a7eade900bcda1a5be608cbb4a8205ce53c6d175d6ae13693ff34b8e2cdc42f9dd4ae49b7285a5f09c1fb4f077ad872361abb8303c1589acf5958436')

package() {
  cd nishiki-teki_*

  # install font
  install -Dm644 nishiki-teki.ttf "$pkgdir/usr/share/fonts/TTF/nishiki-teki.ttf"

  # install docs
  install -Dm644 nishiki-teki.htm "$pkgdir/usr/share/doc/$pkgname/nishiki-teki.htm"
  install -Dm644 img/banner_nishiki-teki.png "$pkgdir/usr/share/doc/$pkgname/img/banner_nishiki-teki.png"
  install -Dm644 img/nishiki.css "$pkgdir/usr/share/doc/$pkgname/img/nishiki.css"

  # install license
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
