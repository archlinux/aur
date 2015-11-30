# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-sakuracloud
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=1
pkgdesc='Module for the fog gem to support Sakura no Cloud'
arch=(any)
url='http://rubygems.org/fog-sakuracloud'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('8ef8c3141b9e18c70e163ac0e1768a4882723384f614a4e6321194c859a9ff8b0e3d01f00df82d1c6054c1ffb81eed445531f8f76f0f92ddb74874c5ad0494d7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
