# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=unf_ext
pkgname=ruby-$_gemname
pkgver=0.0.7.6
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
sha512sums=('c6b6bc797015875b0a3422dc1e9656eae6c42d2263fd6e73ba41a1789ac1ffe927f81d5d9874973fd8d9bd9486494efa725b081e553954121588818d454db7f2')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/${pkgname#ruby-}-$pkgver.gem"
}
