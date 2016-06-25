# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='proxifier'
pkgname="ruby-${_gemname_}"
pkgver='1.0.3'
pkgrel=1
pkgdesc='Proxifier adds support for HTTP or SOCKS proxies and lets you force TCPSocket to use proxies.'
arch=('any')
url='https://github.com/samuelkadolph/ruby-proxifier'
license=('unknown')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('40fef4d2c79313a12b8be2799146cb225b35665975a238ba0d513a96c6a37fa9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
