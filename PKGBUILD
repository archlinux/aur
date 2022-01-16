# Maintainer: Michał Wojdyła < micwoj9292@gmail.com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-core
pkgname=ruby-$_gemname
pkgver=2.2.4
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
sha512sums=('6902aa0e0d4cc3be9ec9e670698f2ad1ddeefa3f418262a73146016ed2aa4b4031a3df98401c43c5a55372cf8aca49bd307192bbf981349959e4ba8361be733e')
