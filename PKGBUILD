# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=tcxread
pkgname=ruby-${_gemname}
pkgver=0.1.5
pkgrel=1
pkgdesc="A parser for TCX files"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby-nokogiri)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('ef9de56cbf2531ea3ed33a23f0f061c0cf3609468776d5c0998b1dda907bbe3c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
