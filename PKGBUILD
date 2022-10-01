# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-rackspace
pkgname=ruby-$_gemname
pkgver=0.1.6
pkgrel=1
pkgdesc='Rackspace provider gem for Fog'
arch=(any)
url='https://github.com/fog/fog-rackspace'
license=(MIT)
depends=(ruby-fog-core ruby-fog-json ruby-fog-xml ruby-ipaddress)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('d531c75379db7b6bb05a1f2d4ff8ba11d0b6d1261646c41f60644e0dcc8e1896')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

