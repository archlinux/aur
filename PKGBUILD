# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=fish-fzf
pkgver=7.0
pkgrel=1
epoch=1
pkgdesc="fzf key-bindings into fish"
arch=('any')
url="https://github.com/PatrickF1/fzf.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3.2' 'fzf>=0.25')
optdepends=('fd>=7.5.0: faster, friendlier alternative to find'
            'bat>=0.16.0: smarter cat with syntax highlighting'
            'git')
makedepends=('git')
# checkdepends=('fish-fishtape')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('eec99573b40d6a5429496b3f5ba3da21080564d7c58b54522cab82a862d1792a67b84c0ac7034d43f1bd50d87982074fee0d3199e2585f6fc5cfcdb78db8b8fb')

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
