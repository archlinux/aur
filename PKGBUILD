# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=ruby-w3c_validators
_pkgname=w3c_validators
pkgver=1.3.3
pkgrel=1
pkgdesc="A Ruby wrapper for the World Wide Web Consortium's online validation services."
arch=(any)
url='https://github.com/w3c-validators/w3c_validators'
license=(GPL)
depends=(ruby-json ruby-nokogiri ruby-pkg-config)
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('e096eb2ae75c70c392fee35c2088347da0200b0400613f5da4a45c7ca5e5eae1')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" \
    "${_pkgname}-${pkgver}.gem" -n "${pkgdir}/usr/bin"
}
