# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-cfpropertylist
_gemname=CFPropertyList
pkgver=2.3.5
pkgrel=1
pkgdesc="A module to read, write and manipulate property lists as defined by Apple."
arch=('any')
url="http://github.com/ckruse/CFPropertyList/"
license=('MIT')
depends=('ruby' 'libxml-ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha512sums=('5efb6441289f66f57069020bd86ba6ad4a469500bcab2f22c3785e43aae5c1c9f87d66ebdf6e96be90c839ce894362404fe1b9fffddec17e3047caad8908cc1b')
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

}
