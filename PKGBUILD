# Maintainer: lmartinez-mirror
pkgname=fish-abbreviation-tips
pkgver=0.5.1
pkgrel=1
pkgdesc="Alias abbreviation tips for fish shell"
arch=('any')
url="https://github.com/gazorby/fish-abbreviation-tips"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
checkdepends=('fish-fishtape')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d3266df9559ea76ac8459304f9a2d9d5223a53418bca606d5dc4f7d11d36ca10ec3725dee7d0744f873e11f6c546bac6006917097836a9d0c2fcc4bf6acb7874')

check() {
  cd "$pkgname-$pkgver"
  fish -Pc "fishtape test/fish-abbreviation-tips.fish"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 conf.d/abbr_tips.fish "$pkgdir/etc/fish/conf.d/abbr_tips.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find functions -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fish/{}" \;
}


