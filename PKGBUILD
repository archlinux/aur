# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

pkgname=ruby-lsp
_gemname=${pkgname}
pkgver=0.14.4
pkgrel=1
pkgdesc="An opinionated language server for Ruby"
arch=("any")
depends=(
  ruby
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('aea8678acb5db89a8d86c852c21b99fb5e42e3539b1f55dcc40757c273e40dec')

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
