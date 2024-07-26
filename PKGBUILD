# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=tcxread
pkgname=ruby-${_gemname}
pkgver=0.1.0
pkgrel=1
pkgdesc="A parser for TCX files"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby-nokogiri)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('af00695c986b4a13d7fac85607b6826e917edfd0d55e5ae9c099448c1619f1f8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}