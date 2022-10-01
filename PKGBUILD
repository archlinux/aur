# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=rbvmomi
pkgname=ruby-$_gemname
pkgver=3.0.0
pkgrel=1
pkgdesc='Ruby interface to the VMware vSphere API'
arch=(any)
url='https://rubygems.org/gems/rbvmomi'
license=(MIT)
depends=(ruby-builder ruby-json ruby-nokogiri ruby-optimist)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('7d2adbd43387c0629c27a37fc5084b4567ac7188a75f55f7f913a9632d603d19')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

