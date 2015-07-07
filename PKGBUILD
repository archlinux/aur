# Maintainer: Olivier Biesmans <olivier at biesmans dot fr>
_gemname=metriks
pkgname=ruby-$_gemname
pkgver=0.9.9.6
pkgrel=1
pkgdesc="An experimental metrics client."
arch=(any)
url="https://rubygems.org/gems/metriks"
license=('GPL')
depends=(ruby ruby-atomic ruby-avl-tree ruby-hitimes)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=(d37ec545dc704a63638f5d02d9cc02600d51bf55c6664a93014168eeac688fc8)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
