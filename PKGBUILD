# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=net-http-persistent
pkgname=ruby-${_gemname}
pkgver=3.0.0
pkgrel=4
pkgdesc="Manages persistent connections using Net::HTTP plus a speed fix for Ruby 1.8"
arch=('any')
url="https://github.com/drbrain/net-http-persistent"
license=('MIT')
depends=(ruby ruby-connection_pool)
makedepends=('ruby-rdoc')
options=(!emptydirs)
noextract=(${_gemname}-${pkgver}.gem)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha1sums=('239d6a0be13c68b171301b146d0c8e0390e28903')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
