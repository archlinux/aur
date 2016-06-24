# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='wmi-lite'
pkgname='ruby-wmi-lite'
pkgver='1.0.0'
pkgrel=1
pkgdesc='A lightweight utility over win32ole for accessing basic WMI functionality in the Microsoft Windows operating system'
arch=('any')
url='https://github.com/opscode/wmi-lite'
license=('Apache-2.0')
depends=('ruby')
options=(!emptydirs)
source=('https://rubygems.org/downloads/wmi-lite-1.0.0.gem')
sha256sums=('e3277c115b4dc58cdfd18224646248bec30d389e4241ae2184d7b227b23cf51a')
noextract=("${_gemname_}-${pkgver}.gem")
package() {
         cd "${srcdir}"
         local _gemdir="$(ruby -e'puts Gem.default_dir')"
         gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
         rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
         install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
