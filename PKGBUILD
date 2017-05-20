# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=json
pkgname=ruby-$_gemname
pkgver=2.1.0
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
sha512sums=('bffbe462e952bca321d4325ecb9c5e9f61e51cad13758581ecfaa6a038bac4e30dc7db50bd897086a5592f6fc437d0e0909f91e279aaf4dd71cf127100c3550b')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
