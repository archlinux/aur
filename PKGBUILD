# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=http
pkgname=ruby-$_gemname
pkgver=0.9.7
pkgrel=1
pkgdesc="An easy-to-use client library for making requests from Ruby. It uses a simple method chaining system for building requests, similar to Python's Requests."
arch=(any)
url='https://github.com/httprb/http'
license=(MIT)
depends=(ruby ruby-addressable ruby-http-cookie ruby-http-form_data ruby-http_parser.rb)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('fd81fa67a0a0b5525ee6d7642cf955676337f91a9b7412ea5817ef58497eb470')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
