# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=xcodeproj
pkgname=ruby-$_gemname
pkgver=1.24.0
pkgrel=2
pkgdesc='Create and modify Xcode projects from Ruby.'
arch=(any)
url='https://github.com/cocoapods/xcodeproj'
license=(MIT)
depends=(
  'ruby-atomos'
  'ruby-cfpropertylist'
  'ruby-claide'
  'ruby-colored2'
  'ruby-nanaimo'
  'ruby-rexml'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a6e0ac757420a5198498b0a26adccb81847cd19c621f88a090e114b48e25eff2')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
