# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=rbvmomi2
pkgname=ruby-$_gemname
pkgver=3.6.1
pkgrel=1
pkgdesc='Ruby interface to the VMware vSphere API'
arch=(any)
url='https://rubygems.org/gems/rbvmomi2'
license=(MIT)
depends=(ruby-builder ruby-json ruby-nokogiri ruby-optimist)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('64959a16cba7414feddbe8ae3e7122ac5e6ce5c895b2a2bf5d399736018cb09b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}


