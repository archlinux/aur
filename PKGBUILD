# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=cache_method
pkgname=ruby-$_gemname
pkgver=0.2.7
pkgrel=1
pkgdesc="Like alias_method, but it's cache_method!"
arch=(any)
url="https://github.com/seamusabshere/cache_method"
license=('N/A')
depends=('ruby' 'ruby-cache')
makedepends=('rubygems')
optdepends=('ruby-activesupport' 'ruby-dalli' 'ruby-minitest' 'ruby-minitest-reporters' 'ruby-yard')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('744b80305fa97451b903035a71be305c1d1fc55995d4f5cebd161da8f3c9e705')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
