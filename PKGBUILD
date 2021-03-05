# Maintainer: lmartinez-mirror
pkgname=fish-fzf
pkgver=5.6
pkgrel=1
pkgdesc="fzf key-bindings into fish"
arch=('any')
url="https://github.com/PatrickF1/fzf.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3.1.2' 'fzf' 'fd' 'bat')
makedepends=('git')
# checkdepends=('fish-fishtape')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ec709b12e0d9908a38f0b2a9a1521f31ce68f9a28660e6d4ff776e684b35ff2071df424d21c0ccc5907143051aa5a8748040c6e6067b491e29d69ef0dba7a191')

# check() {
#   cd "fzf.fish-$pkgver/"
#   find tests -type f -exec fish -Pc 'fishtape {}' \;
# }

package() {
  cd "fzf.fish-$pkgver/"
  install -Dm 644 conf.d/fzf.fish "$pkgdir/etc/fish/conf.d/fzf.fish"
  find functions -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/fish/{}" \;
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


