# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
_gemname=kramdown-man
pkgname=ruby-$_gemname
pkgver=0.1.5
pkgrel=2
pkgdesc="A Kramdown converter for converting Markdown files into man pages"
arch=(any)
url="https://github.com/postmodern/kramdown-man"
license=('MIT')
depends=(ruby "ruby-kramdown>=1.0")
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  cd "$srcdir"

  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

md5sums=('d962e3d5ff8294b5b1d103efcd11df4f')
