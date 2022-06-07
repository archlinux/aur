# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname='ruby-mixlib-log'
_gemname="${pkgname#ruby-}"
pkgver=3.0.9
pkgrel=1
pkgdesc='A gem that provides a simple mixin for log functionality'
arch=('any')
url="https://rubygems.org/gems/${_gemname}/"
license=('Apache')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
b2sums=('249a8c5e88109e9d95d0a6afa74de3a395797594598605d018cc93a8accb824409033028cd62e21b60fd514f5ec1b3c9a0a6237d6fa038b1c1412ce170529eec')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
