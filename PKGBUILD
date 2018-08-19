# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
pkgname=ruby-w3c_validators
_pkgname=w3c_validators
pkgver=1.3.4
pkgrel=1
pkgdesc="A Ruby wrapper for the World Wide Web Consortium's online validation services."
arch=(any)
url='https://github.com/w3c-validators/w3c_validators'
license=(GPL)
depends=(ruby-json ruby-nokogiri ruby-pkg-config)
makedepends=(ruby-rdoc)
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
sha256sums=('a8dde8df4a071d3fd4d1341f3c6e24f671270176a748a0721ec48f82149f04d9')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    "${_pkgname}-${pkgver}.gem"
}
