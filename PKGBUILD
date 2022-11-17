# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog
pkgname=ruby-$_gemname
pkgver=2.3.0
pkgrel=1
pkgdesc='brings clouds to you'
arch=(any)
url='http://github.com/fog/fog'
license=(MIT)
depends=(ruby-fog-aliyun ruby-fog-atmos ruby-fog-aws ruby-fog-brightbox ruby-fog-cloudatcost ruby-fog-cloudstack ruby-fog-core ruby-fog-digitalocean ruby-fog-dnsimple ruby-fog-dynect ruby-fog-ecloud ruby-fog-google ruby-fog-internet-archive ruby-fog-json ruby-fog-local ruby-fog-openstack ruby-fog-ovirt ruby-fog-powerdns ruby-fog-profitbricks ruby-fog-rackspace ruby-fog-radosgw ruby-fog-riakcs ruby-fog-sakuracloud ruby-fog-serverlove ruby-fog-softlayer ruby-fog-storm_on_demand ruby-fog-terremark ruby-fog-vmfusion ruby-fog-voxel ruby-fog-vsphere ruby-fog-xenserver ruby-fog-xml ruby-ipaddress ruby-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('8f3540fd986f209db34f3acac073fbee248199e014d85c1771dcb0a034d6f89d83a7dfe8feddb013344814ee100393d01f75032944f5941bd0416ac5f2e203d1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
