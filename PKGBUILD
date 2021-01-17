# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-ast
pkgname=ruby-${_gemname}
pkgver=1.4.0
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
sha256sums=('92e50baf1e848d9fd437a7c1c1c612bd01697d29f79423397b325f754cb96ee3')

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
