# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=simctl
pkgname=ruby-$_gemname
pkgver=1.6.10
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
sha256sums=('b99077f4d13ad81eace9f86bf5ba4df1b0b893a4d1b368bd3ed59b5b27f9236b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
