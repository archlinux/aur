# Maintainer: farawayer <farwayer@gmail.com>

_gemname=representable
pkgname=ruby-$_gemname
pkgver=3.0.4
pkgrel=3
pkgdesc='Renders and parses JSON/XML/YAML documents from and to Ruby objects. Includes plain properties, collections, nesting, coercion and more.'
arch=(any)
url='https://github.com/apotonick/representable/'
license=(MIT)
provides=("ruby-representable=$pkgver")
depends=(
  ruby
  'ruby-declarative<0.1'
  'ruby-declarative-option<0.2'
  'ruby-uber<0.2'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('fd90074a7f8f44a1d3e72d3ac520c45fd98d892e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
