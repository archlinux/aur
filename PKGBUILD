# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=ruby-w3c_validators
_pkgname=w3c_validators
pkgver=1.3.1
pkgrel=1
pkgdesc="A Ruby wrapper for the World Wide Web Consortium's online validation services."
arch=(any)
url='http://code.dunae.ca/w3c_validators/'
license=(GPL)
depends=(ruby-json ruby-nokogiri ruby-pkg-config)
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('452ca641e6d5994a6de9ee14252c3893206d541db2b09e46cd55398e5f015dc8')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" \
    "${_pkgname}-${pkgver}.gem" -n "${pkgdir}/usr/bin"
}
