# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='net-telnet'
pkgname="ruby-${_gemname_}"
pkgver='0.1.1'
pkgrel=1
pkgdesc='Provides telnet client functionality.'
arch=('x86_64' 'i686')
url='https://github.com/ruby/net-telnet'
license=('unknown')
depends=('ruby')
options=(!emptydirs)
source=('https://rubygems.org/downloads/net-telnet-0.1.1.gem')
sha256sums=('dd2146083225de27f64ce120f8ff4325e424b8e8989bb342d170b0caaffd1d8f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"

}
