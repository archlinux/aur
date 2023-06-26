# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=ruby-slather
pkgver=2.7.4
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
sha256sums=('53a515514bde30eec597dcd61c9cabd4881eb9d6920d4ce49c36ca20727cb14d')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "slather-$pkgver.gem"
  rm "$_gemdir/cache/slather-$pkgver.gem"
  install -D -m644 "$_gemdir/gems/slather-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
