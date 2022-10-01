# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-platform
_gemname=Platform
pkgver=0.4.2
pkgrel=1
pkgdesc="Hopefully robust platform sensing."
arch=('any')
url="http://rubyforge.org/projects/platform/"
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
sha512sums=('ee06c87afbb832ba415b11c5706b7345094fce61e0165f0c09f8e206aed36df5b86cd5fe086e6baede1db6a7f7433edeca506cf9f78830900ebea77fc911c152')
