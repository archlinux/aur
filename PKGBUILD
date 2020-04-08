# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

_gemname=solargraph
pkgname=ruby-solargraph
pkgver=0.38.6
pkgrel=1
pkgdesc="A Ruby language server"
arch=("any")
depends=(
  ruby-maruku
  ruby
  ruby-ast
  ruby-backport
  ruby-e2mmap
  ruby-htmlentities
  ruby-jaro_winkler
  ruby-nokogiri
  ruby-mini_portile2
  ruby-parser
  ruby-ruby-progressbar
  ruby-reverse_markdown
  ruby-rubocop
  ruby-thor
  ruby-tilt
  ruby-unicode-display_width
  ruby-yard
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=("64ffb73c4059d1f703eae978bdc31aa790b3a118949df72ef1016b3140c56c1a")

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
