# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-controller
pkgname=ruby-$_gemname
pkgver=0.8.1
pkgrel=1
pkgdesc='Complete, fast and testable actions for Rack.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-utils ruby-rack)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c5a2224720fb8c72d39e721ea724870363a76c459aef79f94e7a8808d1a7cbc6')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
