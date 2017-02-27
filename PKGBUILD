# Maintainer: Remy Adriaanse <remy@adriaanse.it>

_gemname=nokogiri
pkgname="ruby-${_gemname}"
pkgver=1.7.0.1
pkgrel=2
pkgdesc='HTML, XML, SAX, and Reader parser'
arch=('any')
url='http://nokogiri.org'
license=('MIT')
depends=('libxml2' 'libxslt' 'ruby' 'ruby-mini_portile2')
makedepends=('ruby-pkg-config')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('5be8529b809d210bd10a70c8dbcafec5750585ff47e05de07776f6086ab197a4f195d42ff1c534e6e0eeca19ad257a4ae0fcc62af4ff3b514bb47525d6e106d4')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
