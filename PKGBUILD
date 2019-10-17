# Maintainer: farawayer <farwayer@gmail.com>

_name=xcodeproj
_v=1.13.0
_r=1
_gem=$_name-$_v.gem

pkgname=ruby-$_name
pkgver=$_v
pkgrel=$_r
pkgdesc='Create and modify Xcode projects from Ruby.'
arch=(any)
url='https://github.com/cocoapods/$_name'
license=(MIT)
depends=(
  ruby
  'ruby-atomos>=0.1.3' 'ruby-atomos<0.2'
  'ruby-cfpropertylist>=2.3.3' 'ruby-cfpropertylist<4'
  'ruby-claide>=1.0.2' 'ruby-claide<2'
  'ruby-colored2>=3.1' 'ruby-colored2<4'
  'ruby-nanaimo>=0.2.6' 'ruby-nanaimo<0.3'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gem)
noextract=($_gem)
sha256sums=('9da3a66393b63814d5136dd91712b35d1d9ab8c776437fad3558a48661f6c9b0')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "$_gem"
  rm "$_gemdir/cache/$_gem"
  install -D -m644 "$_gemdir/gems/$_name-$_v/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
