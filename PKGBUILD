# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=net-http-persistent
pkgname=ruby-${_gemname}
pkgver=3.1.0
pkgrel=1
pkgdesc="Manages persistent connections using Net::HTTP plus a speed fix for Ruby 1.8"
arch=('any')
url="https://github.com/drbrain/net-http-persistent"
license=('MIT')
depends=(ruby ruby-connection_pool)
makedepends=('ruby-rdoc')
options=(!emptydirs)
noextract=(${_gemname}-${pkgver}.gem)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha512sums=('65b5afc4ad0729ec14b642e0e36363cecfff3dc25b26308d632866e93fed3eccfb83ce85da78f631553c6a1fe3ee834fcbc9d3681c85db6387463abbc30e60fa')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
