# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-ansi-1.3
_gemname=ansi
pkgver=1.3.0
pkgrel=1
pkgdesc="A collection of ANSI escape code related libraries enabling ANSI colorization and stylization of console output."
arch=('any')
url="http://github.com/rubyworks/ansi"
license=('BSD')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
      -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
sha512sums=('43476d6cb7b33d1e7b6954d9b649c129158b6de7724d1f91b5011ff3c7391eb87ecdcbd6a1275aafb3a1d706fbdb7a67a79151baf99c74b77a8791a16616fc12')
