# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=mbox2csv
pkgname=ruby-${_gemname}
pkgver=0.2.1
pkgrel=1
pkgdesc="Parse MBOX files and export email data into CSV format"
arch=(any)
url="https://github.com/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby-mail ruby-ruby-progressbar)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('d94c13259ab4d44e778edda4b9b43a1709887ea944c17bf4c63db9a266e32678')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
