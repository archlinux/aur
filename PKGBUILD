# Maintainer: lmartinez-mirror
pkgname=fish-pure-prompt
pkgver=4.1.1
pkgrel=2
pkgdesc="Pretty, minimal, and fast prompt for Fish"
arch=('any')
url="https://github.com/pure-fish/pure"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3')
provides=('fish-prompt')
conflicts=('fish-prompt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69e36ecb4a6f979eec9fe90b407849d9b70ad7a6f60c1522d333a4c46c7555eb')

package() {
  cd "pure-$pkgver"
  find conf.d functions -type f -exec install -Dm 755 '{}' "$pkgdir/etc/fish/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
