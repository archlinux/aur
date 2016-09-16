# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=unf_ext
pkgname=ruby-$_gemname
pkgver=0.0.7.2
pkgrel=1
pkgdesc="Unicode Normalization Form support library for CRuby"
arch=(any)
url="https://github.com/knu/ruby-unf_ext"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
optdepends=('ruby-bundler' 'ruby-rake' 'ruby-rakecompiler' 'ruby-rdoc' 'ruby-test-unit')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e8fa13d09880f8d06d30a86f929a38ba0af6abe61272927a49e6796aee1aa111')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
