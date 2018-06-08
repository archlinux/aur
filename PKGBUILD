# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>

_gemname=parseconfig
pkgname=ruby-$_gemname-1
pkgver=1.0.8
pkgrel=1
pkgdesc='Config File Parser for Standard Unix/Linux Type Config Files'
arch=(any)
url='http://github.com/datafolklabs/ruby-parseconfig/'
license=()
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('10a20fc8ea5271c8b6c87735f56b002d078540b6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
