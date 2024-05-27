# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-vsphere
pkgname=ruby-$_gemname
pkgver=3.6.5
pkgrel=1
pkgdesc='Fog for vSphere'
arch=(any)
url='https://github.com/fog/fog-vsphere'
license=(MIT)
depends=(ruby-fog-core ruby-rbvmomi2)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('fddd22c40dbfbc41bef24cd0765a29b11eb952feaed09bad0f7db7bcb434e6bd')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

