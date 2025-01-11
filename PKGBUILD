# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_gemname=mbox2csv
pkgname=ruby-${_gemname}
pkgver=0.1.2
pkgrel=1
pkgdesc="Parse MBOX files and export email data into CSV format"
arch=(any)
url="https://codeberg.org/firefly-cpp/${_gemname}"
license=(MIT)
depends=(ruby-mail)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('1cb035c79c2d77aa1a7ab721ea877fd61367b06907725fc51b5fd913f339b0ef')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
