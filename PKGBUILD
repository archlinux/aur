# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=fish-opendoas-git
pkgver=r6.ae532b7
pkgrel=1
pkgdesc="Fish shell completions for opendoas"
arch=('any')
url="https://git.sr.ht/~lmartinez/fish-opendoas"
license=('MIT')
groups=('fish-plugins')
depends=('fish' 'opendoas')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dvm 644 completions/doas.fish "$pkgdir/etc/fish/completions/doas.fish"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
