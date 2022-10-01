# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-cloudatcost
pkgname=ruby-$_gemname
pkgver=0.4.0
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support CloudAtCost Services.'
arch=(any)
url='https://github.com/fog/fog-cloudatcost'
license=(MIT)
depends=(ruby-fog-core ruby-fog-json ruby-ipaddress)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b93dd31a523f16d737ad0ad9b9e0fbd4aefd89f468ea90002065c6091e3d23af')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

