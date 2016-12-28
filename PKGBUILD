# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=dry-logic
pkgname=ruby-$_gemname
pkgver=0.4.0
pkgrel=1
pkgdesc='Predicate logic with rule composition.'
arch=(any)
url='https://github.com/dryrb/dry-logic'
license=(MIT)
depends=(ruby ruby-dry-container ruby-dry-core ruby-dry-equalizer)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b0cbccd56a4486c9150d02351f1f3957a24c4faa49fe92cac6c232846639a2da')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
