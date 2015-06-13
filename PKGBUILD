# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com> 

pkgname=libxml-ruby
pkgver=2.7.0
pkgrel=2
pkgdesc="Provides Ruby language bindings for the GNOME Libxml2 XML toolkit"
arch=('i686' 'x86_64')
url="http://xml4r.github.com/libxml-ruby"
license=('GPL')
depends=('ruby' 'libxml2')
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('f1f8a3538a064923d8f718748f8771bf088a154c2967f1b7a0cd82d6cd15a9d8')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
