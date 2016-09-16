# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=azure-signature
pkgname=ruby-$_gemname
pkgver=0.2.3
pkgrel=1
pkgdesc="The azure-signature library generates storage signatures for Microsoft Azure's cloud platform"
arch=(any)
url="http://github.com/djberg96/azure-signature"
license=('Apache 2.0')
depends=('ruby' 'ruby-addressable')
makedepends=('rubygems')
optdepends=('test-unit')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('368b53678d31ff017eabe22751f636467f185ff0b0ae77008f4c813e21cc4919')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
