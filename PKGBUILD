# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
pkgname=ruby-capifony
_gemname=${pkgname#ruby-}
pkgver=2.8.3
pkgrel=1
pkgdesc='Deploying symfony and Symfony2 Applications with Capistrano'
arch=('any')
url='http://capifony.org/'
license=('MIT')
depends=('ruby' 'rubygems' 'ruby-capistrano-2>=2.13.5' 'ruby-capistrano-maintenance=0.0.3' 'ruby-colored>=1.2' 'ruby-inifile>=2.0.2', 'ruby-progressbar=1.4.1')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
sha1sums=('6eaa9867e44ef7c0df3e3a4052e2dd443c633830')
