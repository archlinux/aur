# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

pkgname=ruby-prism
_gemname=${pkgname#ruby-}
pkgver=0.27.0
pkgrel=1
pkgdesc="Prism Ruby parser"
arch=("any")
depends=(
  'ruby>=2.7.0'
)
makedepends=(rubygems)
url="http://solargraph.org/"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('f68d0b4f1cc6df903ec6043cd03e54715f12c19aa8399db039a8683f3bf91b77')

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
