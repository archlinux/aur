# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-radosgw
pkgname=ruby-$_gemname
pkgver=0.0.3
pkgrel=1
pkgdesc='Fog backend for provisioning Ceph Radosgw.'
arch=(any)
url='https://github.com/fog/fog-radosgw'
license=(MIT)
depends=(ruby ruby-fog-json ruby-fog-xml ruby-fog-core)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
sha512sums=('6bc044e8eb9b9eaddc470405a4860ee3cb2e0360ad3885afb260a1f217ea01246d4dee964388d25d8fe3bbcad872a65c8678c71a88a4cc740fc41a1a7d41f6a8')
