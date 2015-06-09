# Maintainer: Ralph Amissah <ralph.amissah@gmail.com>
# sisu-gem
# SET pkgver & sha256sums
_pkgname=sisu
_gemname=${_pkgname}
pkgname=("${_pkgname}-gem")
pkgdesc="documents - structuring, publishing in multiple formats & search"
pkgver=7.1.5
pkgrel=1
source=("https://rubygems.org/downloads/sisu-${pkgver}.gem")
sha256sums=('7381baf8a9afeee8d086801c06e896083f5dc5a996692139b0abb53dfad10806')
noextract=("${pkgname}-${pkgver}.gem")
arch=('any')
url="http://sisudoc.org"
license=('GPL3')
depends=('ruby')
makedepends=('ruby')
optdepends=(
  'zip: epub & odf:odt files'
  'unzip: epub & odf:odt files (not required)'
  'tree: report directory structure'
  'imagemagick: image support'
  'graphicsmagick: image support'
  'texlive-core: pdf'
  'texlive-latexextra: pdf'
  'texlive-fontsextra: pdf'
  'texlive-langcjk: pdf Chinese Japanese Korean (large optional dependency, comment out if not needed)'
  'sqlite: search, populate sqlite db'
  'ruby-sqlite3: search, populate sqlite db'
  'postgresql: search, populate postgresql db'
  'ruby-pg: search, populate postresql db'
  'ruby-fcgi: search, sample search form'
  'qrencode: qrcodes based on document metadata'
  )
conflicts=('sisu' 'sisu-git' 'sisu-git-gem')
options=(!emptydirs)
package() {
  msg "Creating arch package from gem ..."
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  msg "gem name: ${_gemname}-${pkgver}.gem"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
}
