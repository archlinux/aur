# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=uuidtools
pkgname=ruby-$_gemname
pkgver=2.2.0
pkgrel=1
pkgdesc='A simple universally unique ID generator library.'
arch=('any')
url="https://rubygems.org/gems/${_gemname}/versions/${pkgver}"
license=('Apache')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
b2sums=('1760c3fcb193901a552b8d32acddd67a0737b95a79bde47854c11a3a6378b008b0e17339ac2e95157329314f35612adc9355068eaef90f93f4d1976fdd430182')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
