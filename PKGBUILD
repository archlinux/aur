# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='rack-protection'
pkgname="ruby-${_gemname_}"
pkgver='1.5.3'
pkgrel=1
pkgdesc='This gem protects against typical web attacks. Should work for all Rack apps, including Rails.'
arch=('any')
url='https://github.com/rkh/rack-protection'
license=('MIT')
depends=('ruby' 'ruby-rack')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha1sums=('1c28529c1d7376c61faed80f3d3297905a14c2b3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname_}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/License" "${pkgdir}/usr/share/licenses/${pkgname}/License"
}
