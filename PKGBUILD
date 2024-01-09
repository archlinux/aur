# Maintainer: Michał Wojdyła < micwoj9292@gmail.com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-core
pkgname=ruby-$_gemname
pkgver=2.4.0
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
sha256sums=('1e204f2f3cbb376f93408e7470f6841df1c2bf03740755ad1f335062018f5d5c')
