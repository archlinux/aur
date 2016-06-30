# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='xpath'
pkgname="ruby-${_gemname_}"
pkgver='2.0.0'
pkgrel=1
pkgdesc='A Ruby DSL for generating XPath expressions'
arch=('any')
url='http://github.com/jnicklas/xpath'
license=('unknown')
depends=('ruby' 'ruby-nokogiri')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
sha256sums=('9ca4a1cc88d9ab16c591468cce7b5d00ee06a8a76b841f8438970c7a44c86c12')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
