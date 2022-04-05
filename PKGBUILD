# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=ruby-azure-armrest
pkgver=0.13.1
pkgrel=1
pkgdesc="This is a Ruby interface for Azure using the newer REST API"
arch=(any)
url="http://github.com/ManageIQ/azure-armrest"
license=('Apache 2.0')
depends=('ruby' 'ruby-activesupport' 'ruby-addressable' 'ruby-azure-signature' 'ruby-cache_method' 'ruby-json' 'ruby-nokogiri' 'ruby-parallel' 'ruby-rest-client')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('9456a4f2d1fde79121bb315d6a9a3f89f72a57a79e99a2a422abd3a03fbd684054b9f04b47366c4f5c0db7b0629098f12131e172c34b1b422edd5714f025fe7e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/${pkgname#ruby-}-$pkgver.gem"
}
