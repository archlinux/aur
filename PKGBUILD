# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Husam Bilal <me@husam.dev>
# Contributor: henning mueller <henning@orgizm.net>

pkgname=ruby-libvirt
pkgver=0.8.3
pkgrel=1
pkgdesc='Ruby bindings for libvirt.'
arch=(i686 x86_64)
license=(LGPL-2.1-or-later)
url=http://libvirt.org/ruby/
depends=(ruby libvirt)
makedepends=(rubygems ruby-rake ruby-rdoc)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('d5eaed883a5baeabc7a07fd405518fc5f5b191480c7da0727b566f21869a2c08')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
