# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-core
pkgname=ruby-$_gemname
pkgver=1.25.0
pkgrel=1
pkgdesc='Shared classes and tests for fog providers and services.'
arch=(any)
url='https://github.com/fog/fog-core'
license=(MIT)
depends=(ruby ruby-builder ruby-excon ruby-formatador ruby-mime-types ruby-net-scp ruby-net-ssh)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
sha512sums=('bcd6adfa9a12724884e20045352e11da99de2c69b3a631aa2a34bc526f7421fe3f3e0503b850a2a2e2606520139c3810c29fc08f6dae85dda1f01bfa68a57d12')
