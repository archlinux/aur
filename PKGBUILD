# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='iniparse'
pkgname="ruby-${_gemname_}"
pkgver='1.4.2'
pkgrel=1
pkgdesc='A pure Ruby library for parsing INI documents'
arch=('any')
url='http://github.com/antw/iniparse'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('1920345bccaab2e6ffb573add6399273c2a0b9ec463f1dff9126736d86c944de')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
