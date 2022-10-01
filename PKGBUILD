# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog
pkgname=ruby-$_gemname
pkgver=2.2.0
pkgrel=1
pkgdesc='brings clouds to you'
arch=(any)
url='http://github.com/fog/fog'
license=(MIT)
depends=(ruby-fog-aliyun ruby-fog-atmos ruby-fog-aws ruby-fog-brightbox ruby-fog-cloudatcost ruby-fog-cloudstack ruby-fog-core ruby-fog-digitalocean ruby-fog-dnsimple ruby-fog-dynect ruby-fog-ecloud ruby-fog-google ruby-fog-internet-archive ruby-fog-json ruby-fog-local ruby-fog-openstack ruby-fog-ovirt ruby-fog-powerdns ruby-fog-profitbricks ruby-fog-rackspace ruby-fog-radosgw ruby-fog-riakcs ruby-fog-sakuracloud ruby-fog-serverlove ruby-fog-softlayer ruby-fog-storm_on_demand ruby-fog-terremark ruby-fog-vmfusion ruby-fog-voxel ruby-fog-vsphere ruby-fog-xenserver ruby-fog-xml ruby-ipaddress ruby-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('df3d54faf8c335dcffb281ada9d5bef2bfd8bc5eeb47ec73213ac4156e074309a0961dc167c156daf17a3bfaac76196260dd6a5a88b0ec9771ed0147121b65f0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
