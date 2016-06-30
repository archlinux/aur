# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname_='sinatra'
pkgname="ruby-${_gemname_}"
pkgver='1.4.7'
pkgrel=1
pkgdesc='Classy web-development dressed in a DSL'
arch=('any')
url='http://www.sinatrarb.com/'
license=('MIT')
depends=('ruby' 'ruby-rack' 'ruby-tilt' 'ruby-rack-protection')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('b7572e8fd4dba57c4bad6ff68cd2b99e4e6e02f3260bdc58a2acd662f29a01ad')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname_}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
