# Maintainer: Armin Preiml <apreiml@strohwolke.at>

_gemname=unicode_plot
pkgname=ruby-$_gemname
pkgver=0.0.5
pkgrel=1
pkgdesc='UnicodePlot provides the feature to make charts with Unicode characters.'
arch=(any)
url='https://github.com/red-data-tools/unicode_plot.rb'
license=(MIT)
depends=(ruby ruby-enumerable-statistics)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
sha256sums=('91ce6237bca67a3b969655accef91024c78ec6aad470fcddeb29b81f7f78f73b')
