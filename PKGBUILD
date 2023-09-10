# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=signet
pkgname=ruby-$_gemname
pkgver=0.18.0
pkgrel=1
pkgdesc="Google's OAuth 1.0 / OAuth 2.0 implementation."
arch=(any)
url='https://rubygems.org/gems/signet'
license=('Apache')
depends=('ruby-addressable' 'ruby-faraday' 'ruby-jwt' 'ruby-multi_json')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('66cda8c2edc2dde25090b792e7e6fc9598c3c2bdd64ffacd89f1ffe3cb9cea3b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
