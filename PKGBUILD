# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Hugo Osvaldo Barrera <hugo at barrera dot io>

_gemname=rotp
pkgname=ruby-$_gemname
pkgver=6.0.0
pkgrel=1
pkgdesc='A Ruby library for generating and verifying one time passwords'
arch=('any')
url="https://github.com/mdp/rotp"
license=('MIT')
depends=('ruby' 'ruby-addressable')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('5f435de3ba5027f67dedecc666fe7f98bae7ecd58ed1475d46f4cfc2936c2206')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -Dm644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
