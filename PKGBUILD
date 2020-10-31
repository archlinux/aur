# Maintainer: Hao Long <aur@esd.cc>

_gemname=progress_bar
pkgname=ruby-$_gemname
pkgver=1.3.2
pkgrel=1
pkgdesc='Simple Progress Bar for output to a terminal'
arch=(any)
url='http://github.com/paul/progress_bar'
license=(WTFPL)
depends=(ruby-highline ruby-options)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('ccd720dc735ccf6038661cba23adc128273f33f64e59193b38268b0f85413b7c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}