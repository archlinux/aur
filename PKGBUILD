# Contributor: Husam Bilal <me@husam.dev>
# Contributor: henning mueller <henning@orgizm.net>

pkgname=ruby-libvirt
pkgver=0.8.2
pkgrel=1
pkgdesc='Ruby bindings for libvirt.'
arch=(i686 x86_64)
license=(GPL)
url=http://libvirt.org/ruby/
depends=(ruby libvirt)
makedepends=(rubygems ruby-rake ruby-rdoc)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('ed9ca80f6a0653412c6e6222d7a4619e71f899bb98ba0540fe01eca47791db6c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
