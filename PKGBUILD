# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='fuzzyurl'
pkgname="ruby-${_gemname_}"
pkgver='0.8.0'
pkgrel=1
pkgdesc='A library for non-strict parsing, construction, and wildcard-matching of URLs.'
arch=('any')
url='https://github.com/gamache/fuzzyurl.rb'
license=('Apache-2.0')
depends=('ruby')
options=(!emptydirs)
source=('https://rubygems.org/downloads/fuzzyurl-0.8.0.gem')
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('591d82dd0e864c4446e9aef0ede7a5deb604645e77b538947ef33f015e6141ea')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"          
}
