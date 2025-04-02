# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname='ruby-mixlib-log'
_gemname="${pkgname#ruby-}"
pkgver=3.2.3
pkgrel=1
pkgdesc='A gem that provides a simple mixin for log functionality'
arch=('any')
url="https://rubygems.org/gems/${_gemname}/"
license=('Apache')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
b2sums=('1a4f60b4ee76ee4bc36087ae0e4c4db26784c17ceb5ba56b7f78584b8c037050fb78e9f2f90fb3c732c4c5ba28e4ab865c05e313f1783fb43576a4337988c152')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
