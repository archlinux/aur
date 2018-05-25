# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

_gemname=reverse_markdown
pkgname=ruby-reverse_markdown
pkgver=1.1.0
pkgrel=0
pkgdesc="Ruby gem to convert html into markdown"
arch=("any")
depends=(
  ruby
  ruby-nokogiri
)
makedepends=(rubygems)
url="http://reverse_markdown.org/"
noextract=($_gemname-$pkgver.gem)
license=("WTFPL")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=("6f396707fe0ad570281e735efd663d0d1c83a00d29f7f812dd52a9468e2dfe70")

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
