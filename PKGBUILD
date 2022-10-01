# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-softlayer
pkgname=ruby-$_gemname
pkgver=1.1.4
pkgrel=1
pkgdesc='Module for the fog gem to support SoftLayer Cloud'
arch=(any)
url='https://github.com/fog/fog-softlayer'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('968747eeceb13ab23cd5aa8504efd4d25e09c645fbcba44e99f8317427d0bd932795635a2c204fdb3460ae4dc9a1dae58e79393589b7abbb4376c848b36d1b20')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
