# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
pkgname=ruby-capistrano-maintenance
_gemname=${pkgname#ruby-}
pkgver=1.2.0
pkgrel=1
pkgdesc='Maintenance Page Support For Capistrano.'
arch=('any')
url='http://rubygems.org/gems/capistrano-maintenance'
license=('MIT')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('81feb673381503e80e0d6f2bdcdd681b520c3f23294ca2f1000f84555e8f0eec')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
