# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-softlayer
pkgname=ruby-$_gemname
pkgver=1.0.2
pkgrel=1
pkgdesc='Module for the fog gem to support SoftLayer Cloud'
arch=(any)
url='https://github.com/fog/fog-softlayer'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e08f8587aca95260444689d79fd65bddf473c2451e1ed59725092a9755859e867a8ac8784953953047df397c4ee1d41f7d9795893f56925a820fd09788493dd1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
