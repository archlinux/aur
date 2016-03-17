# Maintainer: cosarara <cosarara97@gmail.com>
_gemname=temple
pkgname=ruby-$_gemname
pkgver=0.7.6
pkgrel=1
pkgdesc="Template compilation framework in Ruby"
arch=(any)
url="https://github.com/judofyr/temple"
license=('MIT')
depends=(ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('a3a6f88d314b85a1f34cdcd2de459996')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
