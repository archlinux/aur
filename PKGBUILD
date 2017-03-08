# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=json
pkgname=ruby-$_gemname
pkgver=2.0.3
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
sha512sums=('9041ebe6abc52db3ae5bc8b309148965e8e04931999685333a59ea85cf3d47c323554e58a10f2ee4e80a1815540d2a93fb49c981e76d4806a9d43842303778c8')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
