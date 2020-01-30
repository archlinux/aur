# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_gemname="test-unit-rr"
pkgname="ruby-${_gemname}-bootstrap"
pkgver=1.0.5
pkgrel=1
pkgdesc="RR adapter for test-unit (bootstrap version)"
arch=(any)
url="https://github.com/test-unit/test-unit-rr"
license=("LGPL2.1")
depends=("ruby" "ruby-rr")
conflicts=("ruby-${_gemname}")
provides=("ruby-${_gemname}")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
md5sums=('d2919c305ae5355080afc39904d30a62')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
