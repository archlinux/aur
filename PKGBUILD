# Maintainer: farawayer <farwayer@gmail.com>

_gemname=xcodeproj
pkgname=ruby-$_gemname
pkgver=1.10.0
pkgrel=1
pkgdesc='Create and modify Xcode projects from Ruby.'
arch=(any)
url='https://github.com/cocoapods/xcodeproj'
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
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('987d018ee9b8aca61efbdc0cf11e730344661a1a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
