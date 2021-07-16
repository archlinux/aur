# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-ast
pkgname=ruby-${_gemname}
pkgver=1.8.0
pkgrel=1
pkgdesc="RuboCop's Node and NodePattern classes"
arch=(any)
depends=(ruby ruby-parser)
makedepends=(rubygems ruby-rdoc)
url=https://github.com/rubocop-hq/rubocop-ast
noextract=($_gemname-$pkgver.gem)
license=(MIT)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('9e5db97a0066e113412821bd5a8457f46a45e21bd4dd9fe3750d773111a56b35')

package() {
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
