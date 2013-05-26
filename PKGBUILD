# Maintainer: Sven Schneider <youremail@domain.com>

_gemname=utilrb
pkgname=ruby-$_gemname
pkgver=1.6.6
pkgrel=1
pkgdesc="Yet another Ruby toolkit, in the spirit of facets"
arch=(any)
url="http://utilrb.rubyforge.org/utilrb/"
license=('GPL')
depends=(ruby ruby-facets)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=(a2295caedf8453c6a36d84c231e2682c)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
