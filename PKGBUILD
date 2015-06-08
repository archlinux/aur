# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
pkgname=ruby-capistrano-rsync-with-remote-cache
_gemname=capistrano_rsync_with_remote_cache
pkgver=2.4.0
pkgrel=1
pkgdesc='A deployment strategy for Capistrano 2.0 which combines rsync with a remote cache, allowing fast deployments from SCM servers behind firewalls.'
arch=('any')
url='http://www.viget.com/extend/'
license=('MIT')
depends=('ruby' 'rubygems' 'ruby-capistrano')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('6b65eead662a7e825a7dc6f6bbfd389c')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
