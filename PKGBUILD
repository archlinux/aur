# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=azure-armrest
pkgname=ruby-$_gemname
pkgver=0.3.13
pkgrel=1
pkgdesc="This is a Ruby interface for Azure using the newer REST API"
arch=(any)
url="http://github.com/ManageIQ/azure-armrest"
license=('Apache 2.0')
depends=('ruby' 'ruby-activesupport' 'ruby-addressable' 'ruby-azure-signature' 'ruby-cache_method' 'ruby-json' 'ruby-nokogiri' 'ruby-parallel' 'ruby-rest-client')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('ffdd86f34327c66fd19a0bfb6800dffee1702211a466d9b7e5438a2cac13d8b9')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
