# Maintainer: Simon Désaulniers <sim.desaulniers@gmail.com>
_gemname=showterm
pkgname=$_gemname
pkgver=0.5.0
pkgrel=2
pkgdesc="Allows you to make screen casts of your terminal really easily. Integrates with showterm.io for awesome sharability."
arch=(any)
url="http://showterm.io/"
license=('MIT')
depends=(ruby)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5017c01fe8dbe275bfa7c4dd1c807691a1867c802f09e801be22c0d18b1d57c4')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
# vim: ts=2 sw=2 et:
