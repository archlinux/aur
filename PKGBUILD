# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=ovirt-engine-sdk
pkgname=ruby-$_gemname
pkgver=4.4.1
pkgrel=1
pkgdesc='Ruby SDK for the oVirt Engine API.'
arch=(x86_64)
url='https://rubygems.org/gems/ovirt-engine-sdk'
license=(Apache-2.0)
depends=(ruby-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('d5a29c470f3f19d89bb71f2572982227a528b9653bf2ddf1ee691a6a9a634a54')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

