# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname='mixlib-authentication'
pkgname="ruby-${_gemname}"
pkgver='1.4.1'
pkgrel=1
pkgdesc='Mixes in simple per-request authentication'
arch=('any')
url='https://www.chef.io/'
license=('Apache-2.0')
depends=('ruby-mixlib-log')
options=(!emptydirs)
source=('https://rubygems.org/downloads/mixlib-authentication-1.4.1.gem')
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('50bd0bb6789ad44a75582942589fd824f2a3d0a5da80c4fd310b31c3e92c59ec')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
