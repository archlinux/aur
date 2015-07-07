# Maintainer: Olivier Biesmans <olivier at biesmans dot fr>
_gemname=insist
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple block-driven assertion library for both testing and for production code"
arch=(any)
url="https://github.com/jordansissel/ruby-insist"
license=('apache')
depends=(ruby)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=(6f6759eee583dc4e00a6cc3f713cfa7c570572958ba1f5d65595046d795b832f)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
