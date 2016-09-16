# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=cache
pkgname=ruby-$_gemname
pkgver=0.4.1
pkgrel=1
pkgdesc="Wraps memcached, redis(-namespace), memcache-client, dalli and handles their weirdnesses, including forking"
arch=(any)
url="https://github.com/seamusabshere/cache"
license=('N/A')
depends=('ruby')
makedepends=('rubygems')
optdepends=('ruby-activesupport' 'ruby-dalli' 'ruby-memcache-client' 'ruby-memcached' 'ruby-rack' 'ruby-redis' 'ruby-redis-namespace' 'ruby-test-unit' 'ruby-yard')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('d73c092f754d673b3b4ca5a16d678d0c8b73a0d660a3af3c0fce6ff1c9ae5a1c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
