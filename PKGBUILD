# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=ast-tdl
pkgname=ruby-${_gemname}
pkgver=0.0.4
pkgrel=1
pkgdesc="An experimental and minimalistic Training Description Language for Artificial Sport Trainer"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('5fda0ba59fcefd6c85d956150bc13ef202dcb4d9c00a13a9c9b2d1c7c255186d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
