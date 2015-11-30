# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog
pkgname=ruby-$_gemname
pkgver=1.36.0
pkgrel=1
pkgdesc='brings clouds to you'
arch=(any)
url='http://github.com/fog/fog'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml ruby-ipaddress ruby-nokogiri ruby-fog-atmos ruby-fog-aws ruby-fog-brightbox ruby-fog-ecloud ruby-fog-google ruby-fog-local ruby-fog-powerdns ruby-fog-profitbricks ruby-fog-radosgw ruby-fog-riakcs ruby-fog-sakuracloud ruby-fog-serverlove ruby-fog-softlayer ruby-fog-storm_on_demand ruby-fog-terremark ruby-fog-vmfusion ruby-fog-voxel)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('30a8e0e363ae475d574c37ae9d05b29c3f3a95df7f475b38da2ad8e6f5667266aa0b1ec8e0daab33497c7e980e2484f71cfb5372d8496c35eedb4189da10d261')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
