# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: mock
pkgname=ttf-nishiki-teki
pkgver=3.40
pkgrel=2
pkgdesc='A Unicode-based font inspired by a free shell of Ukagaka called “Nishiki”.'
arch=('any')
url='http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki.htm'
license=('custom')
source=("$pkgname-v$pkgver.zip::http://hwm3.gyao.ne.jp/shiroi-niwatori/nishiki-teki.zip"
        "LICENSE")
sha512sums=('c938a8ea5062545992e712dcc79a4903b86ab1d43b58fa7c4250f29db5514b004ff18aacdadbef943fa75d2bdb809982ea478a9fe0e0aff64dddef513e050f28'
            'f6138f41a7eade900bcda1a5be608cbb4a8205ce53c6d175d6ae13693ff34b8e2cdc42f9dd4ae49b7285a5f09c1fb4f077ad872361abb8303c1589acf5958436')

package() {
  cd "nishiki-teki_${pkgver//./_}"

  # install font
  install -Dm644 nishiki-teki.ttf "$pkgdir/usr/share/fonts/TTF/nishiki-teki.ttf"

  # install docs
  install -Dm644 nishiki-teki.htm "$pkgdir/usr/share/doc/$pkgname/nishiki-teki.htm"
  install -Dm644 img/banner_nishiki-teki.png "$pkgdir/usr/share/doc/$pkgname/img/banner_nishiki-teki.png"
  install -Dm644 img/nishiki.css "$pkgdir/usr/share/doc/$pkgname/img/nishiki.css"

  # install license
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
