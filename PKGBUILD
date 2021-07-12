# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=http_parser.rb
pkgname=ruby-$_gemname
pkgver=0.7.0
pkgrel=1
pkgdesc="Ruby bindings to https://github.com/ry/http-parser and https://github.com/a2800276/http-parser.java"
arch=(i686 x86_64)
url='http://github.com/tmm1/http_parser.rb'
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('176ab661633ed25a11a415a745cd82957eaa6eed414aec3327809ae848300af6')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
