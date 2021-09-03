# Maintainer: Bertrand Bonnefoy-Claudet <bertrand@bertrandbc.com>

pkgname=ruby-andand
_gemname=${pkgname#ruby-}
pkgver=1.3.3
pkgrel=3
pkgdesc="Maybe Monad in idiomatic Ruby"
arch=('any')
url="https://github.com/raganwald/andand"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('483d8a01e0d02dfc55de7759527d20c167edf0607983fc4e50a7c3583709346c')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
