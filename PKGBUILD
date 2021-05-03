# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
_gemname=kramdown-man
pkgname=ruby-$_gemname
pkgver=0.1.8
pkgrel=1
pkgdesc="A Kramdown converter for converting Markdown files into man pages"
arch=(any)
url="https://github.com/postmodern/kramdown-man"
license=('MIT')
depends=(ruby "ruby-kramdown>=1.0")
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"

  cd "$srcdir"

  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

md5sums=('6b0e7346e40881f7da3480d930574a73')
