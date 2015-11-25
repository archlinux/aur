# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-sakuracloud
pkgname=ruby-$_gemname
pkgver=0.1.1
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support Sakura no Cloud'
arch=(any)
url='http://rubygems.org/fog-sakuracloud'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
sha512sums=('228b3a391b329af123d3b98cc3a5134b6e6e6da2d5b62fb3e8b562f7c745f6d4356672b078c3a5c1df67de611208ec9c268262d0577405cbc8998f9c26697dc4')
