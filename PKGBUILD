# Maintainer: farwayer <farwayer@gmail.com>

pkgname=ruby-cfpropertylist
_gemname=CFPropertyList
pkgver=3.0.0
pkgrel=1
pkgdesc="A module to read, write and manipulate property lists as defined by Apple."
arch=('any')
url="http://github.com/ckruse/CFPropertyList/"
license=('MIT')
depends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha512sums=('a05090c6914830810cb73b95cfabb8bf37ed236bb798bf746b5c5c4482897eaa3ae093c7b51d902e67ddb8e33d0058266892edb05a2aa47229cfcb335923806d')
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

}
