# Contributor: farwayer <farwayer@gmail.com>

_name=google-cloud-core
_v=1.6.0
_r=1
_gem=$_name-$_v.gem

pkgname=ruby-$_name
pkgver=$_v
pkgrel=$_r
pkgdesc="google-cloud-core is the internal shared library for google-cloud-ruby."
arch=('any')
depends=(
  'ruby-google-cloud-env'
  'ruby-google-cloud-errors'
)
url="https://rubygems.org/gems/$_name"
noextract=($_gem)
options=(!emptydirs)
license=('MIT')
source=(https://rubygems.org/downloads/$_gem)
sha256sums=('ea1744cd5a3085d3072de3fab9106afc769cd198609ebb5c6eeb5f13da46b72a')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "$_gem"
  rm "$_gemdir/cache/$_gem"
  install -D -m644 "$_gemdir/gems/$_name-$_v/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
