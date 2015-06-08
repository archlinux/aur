# ruby-micromachine
# Maintainer : Niels Abspoel <aboe76 (at) Gmail (dot) com>

_gemname="micromachine"
pkgname="ruby-micromachine"
pkgver="1.1.0"
pkgrel=1
pkgdesc="Minimal Finite State Machine."
arch=("any")
url="http://github.com/soveran/micromachine"
license=("RUBY")
makedepends=("ruby"
             "binutils")
depends=("ruby")
source=("http://rubygems.org/gems/$_gemname-$pkgver.gem")
sha256sums=("d107fae66874cd5ea22b8e5f68affd62db45559240d1565c5492f15bc1a4d3da")
noextract=("$_gemname-$pkgver.gem")
options=("!emptydirs")

package () {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
        -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
