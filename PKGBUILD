# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-sakuracloud
pkgname=ruby-$_gemname
pkgver=1.7.5
pkgrel=1
pkgdesc='Module for the fog gem to support Sakura no Cloud'
arch=(any)
url='http://rubygems.org/fog-sakuracloud'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('a7a4a7f45ccb065bd22239b4fe6b52546ff868ff7522eb5e7da107e04083fcd8de66153cc34c2fbbc0d2eca6d8dba3d1657a47a6de0e325cb4e53dce70eea8ca')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
