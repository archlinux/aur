# ruby-micromachine
# Maintainer : Niels Abspoel <aboe76 (at) Gmail (dot) com>

_gemname="micromachine"
pkgname="ruby-micromachine"
pkgver="3.0.0"
pkgrel=1
pkgdesc="Minimal Finite State Machine."
arch=("any")
url="http://github.com/soveran/micromachine"
license=("RUBY")
makedepends=("ruby"
             "binutils")
depends=("ruby")
source=("http://rubygems.org/gems/$_gemname-$pkgver.gem")
sha256sums=('3ef6fad8a07882b5586923f85d453c438c055b3de2778467a7c04827c03ad02b')
noextract=("$_gemname-$pkgver.gem")
options=("!emptydirs")

package () {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
        -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
