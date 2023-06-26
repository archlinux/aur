# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_name=google-cloud-errors
_v=1.3.1
_r=1
_gem=$_name-$_v.gem

pkgname=ruby-$_name
pkgver=$_v
pkgrel=$_r
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
sha256sums=('c0691d480c9770ab7e71d84898895fe022c9643e4b7ad2b1ee839914f691973a')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "$_gem"
  rm "$_gemdir/cache/$_gem"
  install -D -m644 "$_gemdir/gems/$_name-$_v/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
