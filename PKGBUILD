# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=ruby-azure-armrest
pkgver=0.9.4
pkgrel=1
pkgdesc="This is a Ruby interface for Azure using the newer REST API"
arch=(any)
url="http://github.com/ManageIQ/azure-armrest"
license=('Apache 2.0')
depends=('ruby' 'ruby-activesupport' 'ruby-addressable' 'ruby-azure-signature' 'ruby-cache_method' 'ruby-json' 'ruby-nokogiri' 'ruby-parallel' 'ruby-rest-client')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('f8c21e8ee4c2293ab3c4cc5dca6c6b78e791d840ca6bafac80592d50f400bb46499786dd7b1eef7c299013b02db860eec9df14f19850fd62639cc43a98b83265')

package() {
  cd "$srcdir"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
}
