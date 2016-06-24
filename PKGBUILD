# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='sfl'
pkgname="ruby-${_gemname_}"
pkgver='2.2'
pkgrel=1
pkgdesc='Spawn for ruby'
arch=('any')
url='https://github.com/ujihisa/spawn-for-legacy'
license=('unknown')
depends=('ruby')
options=(!emptydirs)
source=('https://rubygems.org/downloads/sfl-2.2.gem')
sha256sums=('323cbf7d9af865dc2bd3fd5f4181798e24a07f02f7b1f935e915f5edd7f4072b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"

}
