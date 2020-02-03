# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

_gemname=roo
pkgname="ruby-${_gemname}"
pkgver=2.8.3
pkgrel=2
pkgdesc='OpenOffice, LibreOffice, Excel, CSV reader'
arch=('any')
url='https://github.com/roo-rb/roo'
license=('MIT')
depends=('ruby' 'ruby-nokogiri' 'ruby-rubyzip')
makedepends=('ruby-pkg-config' 'ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('c8e908ac08ea4d7a979c2c9a364afc5125538c3788e2e0a6123722c2835b56fc')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
