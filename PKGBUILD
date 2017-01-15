# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=twitter
pkgname=ruby-$_gemname
pkgver=6.0.0
pkgrel=1
pkgdesc='A Ruby interface to the Twitter API.'
arch=(any)
url='http://sferik.github.io/twitter/'
license=(MIT)
depends=(ruby ruby-addressable ruby-buftok ruby-equalizer ruby-faraday ruby-http ruby-http_parser.rb ruby-json ruby-memoizable ruby-naught ruby-simple_oauth)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c5e9eb87d222532c556c92e57d2812ef9ee5afb80c9e6c4f392b5bfeff0d0dc2')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
