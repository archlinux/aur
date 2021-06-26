# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=fish-fzf
pkgver=7.1
pkgrel=1
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
sha512sums=('11c89a1ce0fbb9d50370cbb694fb59d0b94847d92ab8333af28493130dce02f55b41df99641d69c6f0503641e891e5ea935ce1e3cb4f095239fd8619ee694e44')

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
