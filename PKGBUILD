# Maintainer: Rubin Simons <me@rubin55.org>

_gemname=solargraph
pkgname=ruby-solargraph
pkgver=0.56.1
pkgrel=1
pkgdesc="A Ruby language server"
arch=("any")
depends=(
  ruby
  ruby-backport
  ruby-benchmark
  ruby-bundler
  ruby-diff-lcs
  ruby-e2mmap
  ruby-jaro_winkler
  ruby-kramdown
  ruby-kramdown-parser-gfm
  ruby-observer
  ruby-parser
  ruby-rbs
  ruby-reverse_markdown
  ruby-rubocop
  ruby-thor
  ruby-tilt
  ruby-yard
  ruby-yard-solargraph
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('3283fae225642db3c20c03d1cffb00c45943694890f6e88ad09ba404c3d790fe')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
