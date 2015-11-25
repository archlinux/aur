# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-softlayer
pkgname=ruby-$_gemname
pkgver=0.3.25
pkgrel=1
pkgdesc='This library can be used as a module for `fog` or as standalone provider to use the SoftLayer Cloud in applications'
arch=(any)
url='https://github.com/fog/fog-softlayer'
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
sha512sums=('9b39320cd6ba0a7ebc3dbcf385516292b018e828f178f566421c9f038921e4d3dcb7aaea55ddcb36571b5cb97734710cd41fd8b58f806c6a94b3d6701dca8e7f')
