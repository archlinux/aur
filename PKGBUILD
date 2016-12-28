# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=dry-core
pkgname=ruby-$_gemname
pkgver=0.2.1
pkgrel=1
pkgdesc='A toolset of small support modules used throughout the dry-rb ecosystem.'
arch=(any)
url='https://github.com/dry-rb/dry-code'
license=(MIT)
depends=(ruby ruby-concurrent-ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('ca4b2212e118a8e1734ae63889eafafd4653bdf0e36622821a19ad914607ac83')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
