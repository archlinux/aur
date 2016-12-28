# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=dry-validation
pkgname=ruby-$_gemname
pkgver=0.10.4
pkgrel=1
pkgdesc='A simple validation library.'
arch=(any)
url='https://github.com/dryrb/dry-validation'
license=(MIT)
depends=(ruby ruby-concurrent-ruby ruby-dry-configurable ruby-dry-container ruby-dry-core ruby-dry-equalizer ruby-dry-logic ruby-dry-types)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('8ce63113fed37e004b95826442df6566b496efc1810fadc151fc4dc5c484b1c6')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
