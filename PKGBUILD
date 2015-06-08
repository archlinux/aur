# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
pkgname=ruby-capistrano-maintenance
_gemname=${pkgname#ruby-}
pkgver=0.0.2
pkgrel=1
pkgdesc='This gem simply offers the recently removed deploy:web:disable and deploy:web:enable tasks to your Capistrano deployment.'
arch=('any')
url='http://rubygems.org/gems/capistrano-maintenance'
license=('Custom')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('959dc359a7d0e4eb13fc553aa4227440')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
