# Maintainer: Hao Long <aur@esd.cc>

_gemname=progress_bar
pkgname=ruby-$_gemname
pkgver=1.3.3
pkgrel=1
pkgdesc='Simple Progress Bar for output to a terminal'
arch=(any)
url='http://github.com/paul/progress_bar'
license=(WTFPL)
depends=(ruby-highline ruby-options)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('873018c6c94a2c33c9d10109719c14d6004d3bbd4d385691fba9c9560b347b12')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
