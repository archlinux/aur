# Contributor: farawayer <farwayer@gmail.com>

_gemname=simctl
pkgname=ruby-$_gemname
pkgver=1.6.8
pkgrel=1
pkgdesc='Ruby interface to xcrun simctl'
arch=(any)
url='https://github.com/plu/simctl'
license=()
depends=(
  ruby
  ruby-cfpropertylist
  ruby-naturally
)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0cbd93d42159b7878253d30c7f505781a3dc1cea')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
