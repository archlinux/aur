# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=ast-tdl
pkgname=ruby-${_gemname}
pkgver=0.1.0
pkgrel=1
pkgdesc="An experimental and minimalistic Training Description Language for Artificial Sport Trainer"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('cdf1f05182c63bca6e43f8af29fefc206e3fa95fd0a3420d248be2e6c1b2c7d9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
