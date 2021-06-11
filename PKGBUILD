# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=ruby-azure-signature
pkgver=0.3.0
pkgrel=1
pkgdesc="The azure-signature library generates storage signatures for Microsoft Azure's cloud platform"
arch=(any)
url="http://github.com/ManageIQ/azure-signature"
license=('Apache 2.0')
depends=('ruby' 'ruby-addressable')
makedepends=('rubygems')
optdepends=('test-unit')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('63ec42c40db2a0546736ce5addd088484ad6b0cf292ca021d7bd0133303b5cfc94629bda96924f194d2f841a0f86f80afc38b5c9e564c155aea36a1b5b505f9b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/${pkgname#ruby-}-$pkgver.gem"

}
