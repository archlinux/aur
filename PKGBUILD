# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_name=google-cloud-errors
_r=1

pkgname=ruby-$_name
pkgver=1.4.0
pkgrel=$_r
_gem=$_name-$pkgver.gem
pkgdesc="google-cloud-errors defines error classes for google-cloud-ruby."
arch=('any')
depends=(
  'ruby'
)
url="https://rubygems.org/gems/$_name"
noextract=($_gem)
options=(!emptydirs)
license=('MIT')
source=(https://rubygems.org/downloads/$_gem)
sha256sums=('0b4e2e0f563db1708732ab4037421d9f26de5cbbbc04be710f2c9cf358e2de14')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "$_gem"
  rm "$_gemdir/cache/$_gem"
  install -D -m644 "$_gemdir/gems/$_name-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
