# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=ast-tdl
pkgname=ruby-${_gemname}
pkgver=0.2.4
pkgrel=1
pkgdesc="An experimental and minimalistic Training Description Language for Artificial Sport Trainer"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby-enum)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('9f9ed96e9a9c0d97d3af7f8597b6a2e13326b80aca56642e9b93ac84aee98247')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
