# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=gssapi
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc='A FFI wrapper around the system GSSAPI library.'
arch=(any)
url='http://github.com/zenchild/gssapi'
license=(MIT)
depends=('ruby' 'ruby-ffi>=1.0.1')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('a71aad96fbd87630daa9c03f1a58de497d6d0b7501e236200ff446937f632e1ef9a3996c2a50dc5c41ac7ea11b88d7f24b0752712cb50e05d3d88b0097d614c1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
