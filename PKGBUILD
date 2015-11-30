# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-cfpropertylist
_gemname=CFPropertyList
pkgver=2.3.2
pkgrel=1
pkgdesc="A module to read, write and manipulate property lists as defined by Apple."
arch=('any')
url="http://github.com/ckruse/CFPropertyList/"
license=('MIT')
depends=('ruby' 'libxml-ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha512sums=('64e7e75fc0828ecafa76ef7c63d2a1537121736e0371eea685997bd216bb5f9ab38505502976bbe60cf49271625af95f43bfbba7c3b477d5436e3327f291aa85')
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

}
