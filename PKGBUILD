# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-core
pkgname=ruby-$_gemname
pkgver=1.35.0
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
sha512sums=('0acac93d4abf552201cf3ac8c31d80960be5d47323480f443e99528665dc3d15846c906f21b1db19f8de9a80729e3ca6048d375c91f964c0fa9dd332d9abc8f2')
