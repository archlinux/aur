# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=ast-tdl
pkgname=ruby-${_gemname}
pkgver=0.2.3
pkgrel=1
pkgdesc="An experimental and minimalistic Training Description Language for Artificial Sport Trainer"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby-enum)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('227792abfbc3735b0c206585399837e8391f5cef3a91b2a56656f2ce7018cc3e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
