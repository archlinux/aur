# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
pkgname=ruby-inifile
_gemname=${pkgname#ruby-}
pkgver=2.0.2
pkgrel=1
pkgdesc='Ruby package for reading and writing INI files.'
arch=('any')
url='http://rubygems.org/gems/inifile'
license=('MIT')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('85343673d62af520d08ef9a01bfb7726')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
