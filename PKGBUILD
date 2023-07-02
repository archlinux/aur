# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-vsphere
pkgname=ruby-$_gemname
pkgver=3.6.2
pkgrel=1
pkgdesc='Fog for vSphere'
arch=(any)
url='https://github.com/fog/fog-vsphere'
license=(MIT)
depends=(ruby-fog-core ruby-rbvmomi2)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('f361ef5c07cf9c1224894c3b1117144fcaa4f39bbc11d791cdfb9d7313b3929f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

