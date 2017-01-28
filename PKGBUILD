# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=ruby-w3c_validators
_pkgname=w3c_validators
pkgver=1.3.2
pkgrel=1
pkgdesc="A Ruby wrapper for the World Wide Web Consortium's online validation services."
arch=(any)
url='http://code.dunae.ca/w3c_validators/'
license=(GPL)
depends=(ruby-json ruby-nokogiri ruby-pkg-config)
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('61d3526a3bc179d0dfccc71cb1b1c126075cb159bf7c5e0ea2e5e2e091ec7f5d')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" \
    "${_pkgname}-${pkgver}.gem" -n "${pkgdir}/usr/bin"
}
