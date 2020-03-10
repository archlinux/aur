# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: mock
pkgname=ttf-nishiki-teki
pkgver=3.65l
pkgrel=1
pkgdesc='Unicode-based font inspired by a free shell of Ukagaka called “Nishiki”'
arch=('any')
url='http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki.htm'
license=('custom')
source=("$pkgname-$pkgver.zip::http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki.zip"
        "LICENSE")
sha512sums=('26a01eeee9efa9d2b86b5da878688f173da7d3e8fe40fe76ce2c48d2cc5e13cdccbff7c13da33bf5efadc5f6b2e7ae3198e025987b58b086745b95dc5757bb12'
            'f6138f41a7eade900bcda1a5be608cbb4a8205ce53c6d175d6ae13693ff34b8e2cdc42f9dd4ae49b7285a5f09c1fb4f077ad872361abb8303c1589acf5958436')

package() {
  # this feels like a hacky workaround
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
