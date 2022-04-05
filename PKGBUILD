# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=unf_ext
pkgname=ruby-$_gemname
pkgver=0.0.8.1
pkgrel=1
pkgdesc="Unicode Normalization Form support library for CRuby"
arch=(any)
url="https://github.com/knu/ruby-unf_ext"
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
optdepends=('ruby-bundler' 'ruby-rake' 'ruby-rdoc' 'ruby-test-unit')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('8bc698071471f65bf0d08f21e8ae4607778a9021b78c8b00e82725cccf3876d7357a1555d003c83b6182605247f3bf01a6c2ecc4dfac52ca93a0f37da2c76d8c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/${pkgname#ruby-}-$pkgver.gem"
}
