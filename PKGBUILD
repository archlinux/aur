# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='capybara'
pkgname="ruby-${_gemname_}"
pkgver='2.7.1'
pkgrel=1
pkgdesc='An integration testing tool for rack based web applications'
arch=('any')
url='https://github.com/jnicklas/capybara'
license=('MIT')
depends=('ruby' 'ruby-addressable' 'ruby-mime-types' 'ruby-nokogiri' 'ruby-rack' 'ruby-rack-test' 'ruby-xpath')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
sha256sums=('2c010cefb36e701bc576223c877ed173b316d06e5d50512eb242cde487bed513')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
