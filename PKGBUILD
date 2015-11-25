# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-vmfusion
pkgname=ruby-$_gemname
pkgver=0.0.1
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support VMWARE FUSION.'
arch=(any)
url='http://rubygems.org/gems/fog-vmfusion'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fission)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
sha512sums=('9f4a6de5d2ca273b192de65be78476399cda8a9218ef5f82119f6aa48f40a8038d1a9551bb000d3a5715f92eac00935be3058f4454d18d72b15107fd10902417')
