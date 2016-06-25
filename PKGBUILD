# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='net-sftp'
pkgname="ruby-${_gemname_}"
pkgver='2.1.2'
pkgrel=1
pkgdesc='A pure Ruby implementation of the SFTP client protocol'
arch=('any')
url='https://github.com/net-ssh/net-sftp'
license=('MIT')
depends=('ruby' 'ruby-net-ssh')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('3e70b8130b1c86039b0847aeb088a2254df49053023546a5923e5763c923c710')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
