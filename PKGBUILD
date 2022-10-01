# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-openstack
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc='OpenStack fog provider gem.'
arch=(any)
url='https://github.com/fog/fog-openstack'
license=(MIT)
depends=(ruby-fog-core ruby-fog-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('47f5406164769fe0702ade00e5519d09e6db905a54e29475cfa7050a80c609f6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

