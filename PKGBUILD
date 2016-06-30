# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='mysql2'
pkgname="ruby-${_gemname_}"
pkgver='0.4.4'
pkgrel=1
pkgdesc='A simple, fast Mysql library for Ruby, binding to libmysql'
arch=('any')
url='http://github.com/brianmario/mysql2'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
sha256sums=('2adf72de58581ddb17abe952f5c7843ee0caf3455ed20c82f9c41583ce3aa3ec')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
