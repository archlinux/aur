# Maintainer: Tau <tau at ea7aba dot be>

_gemname=fontcustom
pkgname=$_gemname
pkgver=2.0.0
pkgrel=4
pkgdesc="A tool for building icon fonts from svg images"
arch=('any')
url="https://github.com/FontCustom/fontcustom"
license=('MIT')
depends=('ruby' 'zlib' 'fontforge' 'sfnt2woff' 'woff2' \
	'ruby-json-1' 'ruby-thor' 'ruby-listen' 'ruby-ruby_dep')
makedepends=('rubygems' 'ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c6da0f8d0b789acb33ae39059fea321b2198b45828e9f9b61ecbc9db53b92be5')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}
