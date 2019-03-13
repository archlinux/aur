# Maintainer: farawayer <farwayer@gmail.com>

_gemname=xcpretty-travis-formatter
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=3
pkgdesc='xcpretty custom formatter for TravisCI'
arch=(any)
url='https://github.com/kattrali/xcpretty-travis-formatter'
license=(MIT)
depends=(
  ruby
  'ruby-xcpretty>=0.2' 'ruby-xcpretty<1'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('33e9e49312ba15d6172dde7795d8629223c723c5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
