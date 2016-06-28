# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='cancan'
pkgname="ruby-${_gemname_}"
pkgver='1.6.10'
pkgrel=1
pkgdesc='Simple authorization solution for Rails which is decoupled from user roles'
arch=('any')
url='http://github.com/ryanb/cancan'
license=('unknown')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
sha256sums=('04ac3df0bae528c2304bf3e523f64cbaa5d4345bedaccd0c33b8635104862d23')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
