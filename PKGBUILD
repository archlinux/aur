# Maintaineir: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-aws
pkgname=ruby-$_gemname
pkgver=0.7.6
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support Amazon Web Services.'
arch=(any)
url='http://github.com/fog/fog-aws'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml ruby-ipaddress)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('2b5d4430cda2a84861799efd6e7a6f9b17eea253ed9d9a625d32121556c7a1df9ccb51032d66092a714ce19dbed11c15b1cc54b58d7339784bf816dbdc07ba40')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
