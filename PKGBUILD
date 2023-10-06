# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=ruby-slather
pkgver=2.7.5
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
sha256sums=('7c44574e78a30d11b48e1fc4ca366151b2c2bbae9edfb043cc0c28f3368e89ff')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "slather-$pkgver.gem"
  rm "$_gemdir/cache/slather-$pkgver.gem"
  install -D -m644 "$_gemdir/gems/slather-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
