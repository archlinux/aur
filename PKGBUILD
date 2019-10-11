# Maintainer: farwayer <farwayer@gmail.com>

pkgname=ruby-cfpropertylist
_gemname=CFPropertyList
pkgver=3.0.1
pkgrel=1
pkgdesc="A module to read, write and manipulate property lists as defined by Apple."
arch=('any')
url="http://github.com/ckruse/CFPropertyList/"
license=('MIT')
depends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha512sums=('0201c92d6f97b0bebe6a11fc8d23cd6fb6d33c3a4a916595b37a50bfdc74b137e253942af87a0a8463f1465b028cab6e220a05f4753f3d248e575bbce3099337')
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

}
