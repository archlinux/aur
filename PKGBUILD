# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

_gemname=roo
pkgname="ruby-${_gemname}"
pkgver=2.10.0
pkgrel=1
pkgdesc='OpenOffice, LibreOffice, Excel, CSV reader'
arch=('any')
url='https://github.com/roo-rb/roo'
license=('MIT')
depends=('ruby' 'ruby-nokogiri' 'ruby-rubyzip')
makedepends=('ruby-pkg-config' 'ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('c7c4b21f89a974329724cf06f4afcdc8dd75d5adc5df5e4dbb705e0e6bb3f9c8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
