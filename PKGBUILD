# Maintainer: Loen <christopherloen@gmail.com>
_gemname='shoes'
pkgname='ruby-shoes'
pkgver='3.0.1'
pkgrel=1
pkgdesc='The best little GUI toolkit for Ruby'
arch=('any')
url='http://github.com/shoes/shoes'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/shoes-3.0.1.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha1sums=('61a92fc933e1d8335bfd65dcc46a3198ed5803a9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
