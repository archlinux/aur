# Maintainer: philanecros <philanecros@gmail.com>

_gemname=circler
pkgname=ruby-${_gemname}
pkgver=0.3.2
pkgrel=1
pkgdesc="A command line tool for circle ci"
arch=('any')
url="https://github.com/unhappychoice/circler"
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
md5sums=('f1c8a1b22a6a87cd7329cddcca98a255')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
}

# vim:set ts=2 sw=2 et:
