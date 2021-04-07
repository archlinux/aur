# Maintainer: lmartinez-mirror
pkgname=fish-ayu-theme
pkgver=2.0.0
pkgrel=1
pkgdesc="ayu color theme for Fish shell"
arch=('any')
url="https://github.com/edouard-lopez/ayu-theme.fish"
license=('unknown')
groups=('fish-plugins')
depends=('fish')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1b65ee89ec513f4d062a643d9220fa3f9debc1b6ff5387252f4eeafd208ca71')

prepare() {
  test -d "$pkgname-$pkgver" || mv "ayu-theme.fish-$pkgver" "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  find conf.d -type f -exec install -Dm 644 '{}' "$pkgdir/etc/fish/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
