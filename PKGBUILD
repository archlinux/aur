# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname_='rack-cache'
pkgname=ruby-${_gemname_}
pkgver='1.6.1'
pkgrel=1
pkgdesc='A quick drop-in component to enable HTTP caching for Rack-based applications'
arch=('any')
url='http://tomayko.com/src/rack-cache/'
license=('MIT')
depends=('ruby' 'ruby-rack')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('613a4e88661ea7014211d39e5f99e18f35f6aa37ac7ef96001160131c0311490')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}

