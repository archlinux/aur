# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: cosarara <cosarara97@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='tilt'
pkgname="ruby-${_gemname}"
pkgver='2.0.5'
pkgrel=1
pkgdesc='Generic interface to multiple Ruby template engines'
arch=('any')
url='https://github.com/rtomayko/tilt/'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('0ec3e46ff4dcbabe0e90af1e92786b3c88312ebca55816b04f2511d1dd42f351')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
