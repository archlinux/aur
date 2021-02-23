# Maintainer: Simon Désaulniers <sim.desaulniers@gmail.com>
_gemname=showterm
pkgname=$_gemname
pkgver=0.6.0
pkgrel=2
pkgdesc="Allows you to make screen casts of your terminal using showterm.io."
arch=(any)
url="http://showterm.io/"
license=('MIT')
depends=(ruby)
makedepends=(rubygems)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  install -dm 755 "$pkgdir/usr/bin"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" -v 0.6.0 $_gemname
}
# vim: ts=2 sw=2 et:
