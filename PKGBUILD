# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=ruby-slather
pkgver=2.8.0
pkgrel=1
pkgdesc='Test coverage reports for Xcode projects'
arch=(any)
url='https://github.com/SlatherOrg/slather'
license=(MIT)
depends=(
  'ruby-activesupport'
  'ruby-cfpropertylist'
  'ruby-clamp'
  'ruby-nokogiri'
  'ruby-xcodeproj'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/slather-$pkgver.gem)
noextract=(slather-$pkgver.gem)
sha256sums=('27f170bba4d5157613fa583ef260d2a556a9b9fa07d609c753afefc4b06d58a6')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "slather-$pkgver.gem"
  rm "$_gemdir/cache/slather-$pkgver.gem"
  install -D -m644 "$_gemdir/gems/slather-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
