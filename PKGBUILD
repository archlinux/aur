# Maintainer: Armin Preiml <apreiml@strohwolke.at>

_gemname=youplot
pkgname=ruby-$_gemname
pkgver=0.4.5
pkgrel=1
pkgdesc='YouPlot is a command line tool that draws plots on the terminal.'
arch=(any)
url='https://github.com/red-data-tools/YouPlot'
license=(MIT)
depends=(ruby ruby-unicode_plot)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
sha256sums=('31b7a5d38a0924953e77a5cc8d463106c1282e457fddea1dbeb3bd297931be46')
