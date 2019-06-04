# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: mock
pkgname=ttf-nishiki-teki
pkgver=3.51k
pkgrel=1
pkgdesc='Unicode-based font inspired by a free shell of Ukagaka called “Nishiki”'
arch=('any')
url='http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki.htm'
license=('custom')
source=("$pkgname-v$pkgver.zip::http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki.zip"
        "LICENSE")
sha512sums=('c46286a7e93f15ea979f09a43b6d2b6b9d5a176d47692010a68a4acd8122879623bb293f66c8d2a3fb8d7345d833641050b5a25056ac74ebd862e4a4bed721b9'
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
