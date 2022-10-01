# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-vsphere
pkgname=ruby-$_gemname
pkgver=3.5.2
pkgrel=1
pkgdesc='Fog for vSphere'
arch=(any)
url='https://github.com/fog/fog-vsphere'
license=(MIT)
depends=(ruby-fog-core ruby-rbvmomi)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('6ff73472c76510c4f136c3fe9e7dca76752cbce1910262b96685d4b3c3f6857c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

