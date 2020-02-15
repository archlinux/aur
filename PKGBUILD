# Maintainer: Hao Long <aur@esd.cc>

_gemname=progress_bar
pkgname=ruby-$_gemname
pkgver=1.3.1
pkgrel=1
pkgdesc='Simple Progress Bar for output to a terminal'
arch=(any)
url='http://github.com/paul/progress_bar'
license=(WTFPL)
depends=(ruby-highline ruby-options)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3633e9d0d8424f6480e1f0b3299f3e234e9417e0110bc8168b43236de712a1b1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}