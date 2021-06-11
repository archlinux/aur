# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=ruby-azure-armrest
pkgver=0.11.0
pkgrel=1
pkgdesc="This is a Ruby interface for Azure using the newer REST API"
arch=(any)
url="http://github.com/ManageIQ/azure-armrest"
license=('Apache 2.0')
depends=('ruby' 'ruby-activesupport' 'ruby-addressable' 'ruby-azure-signature' 'ruby-cache_method' 'ruby-json' 'ruby-nokogiri' 'ruby-parallel' 'ruby-rest-client')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('5bc7e7563ea5603b87acb7c541356f3023651743eefc2537088d1cccce0e7c967c2a7603de1c48466d8054b5040d7a98b1a8cb61a3c28b1cd298d24a60fa21b8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/${pkgname#ruby-}-$pkgver.gem"
}
