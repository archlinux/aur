# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname='ruby-mixlib-log'
_gemname="${pkgname#ruby-}"
pkgver=1.6.0
pkgrel=1
pkgdesc='A gem that provides a simple mixin for log functionality'
arch=('any')
url="https://rubygems.org/gems/${_gemname}/"
license=('Apache')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
b2sums=('227904e69a292b283d791c33350153bc4ffdd207cc729ed794dd6fd2602e321e3305b71bff7b6a47cb96a1afbcf76d8c55e9524058c8c86cdc416a74b10fa510')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
