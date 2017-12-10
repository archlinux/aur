# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=ruby-cache
pkgver=0.4.1
pkgrel=1
pkgdesc="Wraps memcached, redis(-namespace), memcache-client, dalli and handles their weirdnesses, including forking"
arch=(any)
url="https://github.com/seamusabshere/cache"
license=('N/A')
depends=('ruby')
makedepends=('rubygems')
optdepends=('ruby-activesupport' 'ruby-dalli' 'ruby-memcache-client' 'ruby-memcached' 'ruby-rack' 'ruby-redis' 'ruby-redis-namespace' 'ruby-test-unit' 'ruby-yard')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha256sums=('d73c092f754d673b3b4ca5a16d678d0c8b73a0d660a3af3c0fce6ff1c9ae5a1c')

package() {
  cd "$srcdir"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
}
