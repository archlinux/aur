# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=tcxread
pkgname=ruby-${_gemname}
pkgver=0.1.4
pkgrel=1
pkgdesc="A parser for TCX files"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby-nokogiri)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('fafa2a7f9f994b428894f66a68a05f0210cfc95b492e3abf5c48f77f6de3cb3e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
