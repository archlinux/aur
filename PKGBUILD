# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname='ruby-mixlib-log'
_gemname="${pkgname#ruby-}"
pkgver=3.2.0
pkgrel=1
pkgdesc='A gem that provides a simple mixin for log functionality'
arch=('any')
url="https://rubygems.org/gems/${_gemname}/"
license=('Apache')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
b2sums=('8d937fc06d7efd6fb71bcb1dad0a00a837ed92319ee3ba4646373b569cb45448535e7afd92549f83b941eaeeed6d9d313d9c6762c0d9c4d13afdb8519aaf15b8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
