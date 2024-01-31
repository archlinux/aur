# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: farawayer <farwayer@gmail.com>

pkgname=ruby-xcodeproj
pkgver=1.24.0
pkgrel=1
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
source=(https://rubygems.org/downloads/xcodeproj-$pkgver.gem)
noextract=(xcodeproj-$pkgver.gem)
sha256sums=('a6e0ac757420a5198498b0a26adccb81847cd19c621f88a090e114b48e25eff2')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "xcodeproj-$pkgver.gem"
  rm "$_gemdir/cache/xcodeproj-$pkgver.gem"
  install -D -m644 "$_gemdir/gems/xcodeproj-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
