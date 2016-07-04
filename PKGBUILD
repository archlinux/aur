# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-excon
_gemname=excon
pkgver=0.50.1
pkgrel=1
pkgdesc="EXtended http(s) CONnections"
arch=('any')
url="https://github.com/geemus/excon"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" "${_gemname}-${pkgver}.gem"
}
sha512sums=('ab54beb2a12c27077c65cdebae44b1794a2fd727c0afb57d5dcbf00bf6e6418cdb2fddfdcc0f0b00110aea0887ea9d3109d3772d1c3c89deb8f528913bc55079')
