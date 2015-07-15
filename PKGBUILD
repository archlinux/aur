# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=trollop
pkgname=ruby-$_gemname
pkgver=2.1.2
pkgrel=1
pkgdesc='Trollop is a commandline option parser for Ruby that just gets out of your way.'
arch=(any)
url='http://manageiq.github.io/trollop/'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('87a11bff3e9d08702487108cb18e01299112df44')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
