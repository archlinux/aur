# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=tcxread
pkgname=ruby-${_gemname}
pkgver=0.2.0
pkgrel=1
pkgdesc="A parser for TCX files"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby-nokogiri)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('be8a4655c702b5ce2a2609dd4ad391a7a86c56023871e690ef3d5031df9c9d26')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
