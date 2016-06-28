# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='rails-dom-testing'
pkgname="ruby-${_gemname_}"
pkgver='2.0.1'
pkgrel=1
pkgdesc='Compares doms and assert certain elements exists in doms using Nokogiri'
arch=('any')
url='https://github.com/rails/rails-dom-testing'
license=('MIT')
depends=('ruby' 'ruby-activesupport' 'ruby-nokogiri')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
sha256sums=('b108ebe8d0b61729921e1380983f663912edcf90e8dec822dae9001a9b3d4e97')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
