# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname='rack-test'
pkgname="ruby-${_gemname}"
pkgver='0.6.3'
pkgrel=2
pkgdesc='Simple testing API built on Rack'
arch=('any')
url='http://github.com/brynary/rack-test'
license=('MIT')
depends=('ruby' 'ruby-rack')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('ff60b122e2940e32e94a2e4a61bceb8d9c99a97c1817ecc47e535522b02cdd40')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/MIT-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE.txt"
}
