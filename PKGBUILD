# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-cfpropertylist
_gemname=CFPropertyList
pkgver=2.2.8
pkgrel=2
pkgdesc="A module to read, write and manipulate property lists as defined by Apple."
arch=('any')
url="http://github.com/ckruse/CFPropertyList/"
license=('MIT')
depends=('ruby' 'libxml-ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha512sums=('7444839ae3cd75a3c7526fb1798aabd548acc2d6a5143f18aa3a83cee479f4f8905846ae52ef1299ac0054f3f166c701c09678443271cc6cbb1654eac3002e3f')
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

}
