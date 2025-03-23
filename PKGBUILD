# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_pkgname="fish-autopair"
pkgname="$_pkgname"
pkgver=1.0.4
pkgrel=2
pkgdesc="Auto-complete matching pairs in the Fish command line"
url="https://github.com/jorgebucaran/autopair.fish"
license=('MIT')
arch=('any')

depends=('fish')
makedepends=('git')

conflicts=('fish-pisces')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=$pkgver?signed")
sha256sums=('de99e55cc6ebdbd96ac11a68f45f00f4ad354d7b3895a6897d4a3245315ebc5e')
validpgpkeys=('CA88B7CBEDCEE375F2376C53E54BA3C0E646DB30')

package() {
  cd "$_pkgsrc"
  install -Dm644 conf.d/autopair.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
  find functions -type f -exec install -Dm644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
