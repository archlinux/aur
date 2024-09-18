# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=mbox2csv
pkgname=ruby-${_gemname}
pkgver=0.1.0
pkgrel=1
pkgdesc="Parse MBOX files and export email data into CSV format"
arch=(x86_64)
url="https://codeberg.org/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby-mail)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('c308f27b0001f22bd5ca821a3cbc47e5e21f241acb33b9559e67fa5130f2fa58')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
