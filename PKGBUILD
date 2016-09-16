# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=json
pkgname=ruby-$_gemname
pkgver=2.0.2
pkgrel=1
pkgdesc="This is a JSON implementation as a Ruby extension in C"
arch=(any)
url="http://json-jruby.rubyforge.org/"
license=('Ruby')
depends=('ruby')
optdepends=('ruby-test-unit' 'ruby-rake')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('400f60ac8282da80764c5d6fbb04c096390a85950bb488652abc1eb993b411d2')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
