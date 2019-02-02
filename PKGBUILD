# Contributor: gem2arch 0.1
# Contributor: theapodan
# Contributor: mnussbaum

pkgname=ruby-htmlentities
_gemname=htmlentities
pkgver=4.3.4
pkgrel=2
pkgdesc="A Ruby library to encode named and numerical entities in HTML and XHTML documents"
arch=("any")
url="https://github.com/threedaymonk/htmlentities"
license=("MIT")
depends=("ruby")
makedepends=("rubygems")
options=(!emptydirs)
noextract=("$_gemname-$pkgver.gem")
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=("125a73c6c9f2d1b62100b7c3c401e3624441b663762afa7fe428476435a673da")

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

# vim:set ts=2 sw=2 et:
