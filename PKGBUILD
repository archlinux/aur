# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rspectacular
pkgname=ruby-$_gemname
pkgver=0.70.8
pkgrel=1
pkgdesc="We rock some RSpec configurations and matchers like it ain't nobody's bidnezz"
arch=(any)
url=https://rubygems.org/gems/rspectacular
license=(MIT)
depends=(ruby ruby-rspec ruby-fuubar)
makedepends=(rubygems ruby-rdoc)
noextract=($_gemname-$pkgver.gem)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('83b51f13bfb955399771c123379119d3c9362c5c140531c520324335025af144')

package() {
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
