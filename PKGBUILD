# Maintainer: Greg Sutcliffe <greg.sutcliffe at gmail dot com>

_gemname=ruby-augeas
pkgname=$_gemname
pkgver=0.5.0
pkgrel=0
pkgdesc="Provides Ruby bindings for augeas"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://augeas.net"
license=('LGPL')
depends=(ruby augeas)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-${pkgver//_/-}.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('0638a1a9c1bfbc8a94efca9ee24216b5')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver//_/-}.gem"
}


package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
