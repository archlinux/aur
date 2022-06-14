# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

_gemname=roo
pkgname="ruby-${_gemname}"
pkgver=2.9.0
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
sha256sums=('a569b1734e83c9304d007dbd2c723ffa55557d48243fd19f760ab3dcb009d56b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
