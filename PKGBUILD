# Maintainer: Michał Wojdyła < micwoj9292@gmail.com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-core
pkgname=ruby-$_gemname
pkgver=2.3.0
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
sha512sums=('449490e67a4b3a3b46afffcefc6214d527a81dcc4718518643f63a0a04a7fa141a3e812748d790a74de475228788086b6c92ebdc67917e4c63934a6296dcb5cd')
