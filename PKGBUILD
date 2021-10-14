# Maintainer: Tim Meusel
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=rspec-support
pkgname=ruby27-${_gemname}
pkgver=3.10.2
pkgrel=1
pkgdesc='Common code needed by the other RSpec gems. Not intended for direct use'
url='https://github.com/rspec/rspec-support'
arch=('any')
license=('MIT')
depends=('ruby2.7' 'ruby27-rdoc')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('c8825dbf8fc5f044de65400fb3f4d6f4d9352167b40caef904afecdc12ae1e4156590a20f222cf841887549d59a88a057bd503759147cf8ec4ddd05679732e1f')

package() {
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --ignore-dependencies --no-user-install --install-dir "${pkgdir}${_gemdir}" --bindir "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
