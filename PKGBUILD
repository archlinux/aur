# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=fish-fzf
pkgver=6.5
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('89b58a736f050c0968459a9611638c0697947c5ea494973dc4036690544bcc237de371eedd60eec94420195c7346f020991fb2cc725d5cf8af4426f08c8bd059')

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
