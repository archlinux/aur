# Maintainer: lmartinez-mirror
pkgname=fish-autopair
pkgver=1.0.3
pkgrel=1
pkgdesc="Auto-complete matching pairs in the Fish command line"
arch=('any')
url="https://github.com/jorgebucaran/autopair.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish')
conflicts=('fish-pisces' 'fish-autopair-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('085b2661cf5177ef60406dd7c98abf7e79acc650d8127d380f412a191681acf134d880b18ccf6aa286d2ba1e28c7f1642ea546a122df942ea84c6001cb147050')

package() {
  cd "autopair.fish-$pkgver"
  install -Dm644 conf.d/autopair.fish "$pkgdir/etc/fish/conf.d/autopair.fish"
  find functions -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fish/{}" \;
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.md"
}

