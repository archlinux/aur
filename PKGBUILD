# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=nkf
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc='Ruby extension for Network Kanji Filter'
arch=(any)
url='https://github.com/ruby/nkf'
license=(Ruby BSD-2-Clause)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
sha256sums=('fbc151bda025451f627fafdfcb3f4f13d0b22ae11f58c6d3a2939c76c5f5f126')
