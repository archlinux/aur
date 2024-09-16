# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292@gmail.com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-core
pkgname=ruby-$_gemname
pkgver=2.5.0
pkgrel=1
pkgdesc='Shared classes and tests for fog providers and services.'
arch=(any)
url='https://github.com/fog/fog-core'
license=(MIT)
depends=(ruby-builder ruby-excon ruby-formatador ruby-mime-types)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
sha256sums=('b47b80647a6e5817455ec2baa8f5ca5e3f431d9518e876d55330d08b450cc2ed')
