# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=ruby-cache_method
pkgver=0.2.7
pkgrel=1
pkgdesc="Like alias_method, but it's cache_method!"
arch=(any)
url="https://github.com/seamusabshere/cache_method"
license=('N/A')
depends=('ruby' 'ruby-cache')
makedepends=('rubygems')
optdepends=('ruby-activesupport' 'ruby-dalli' 'ruby-minitest' 'ruby-minitest-reporters' 'ruby-yard')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('72a311551097cb35eab5b8493f00c2af4cf6bc9bc530252fef14a7652e50f672ba5fc6a1dac7d4812e52b624e4c8807fc95130179cd220373316718f527439a0')

package() {
  cd "$srcdir"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
}
