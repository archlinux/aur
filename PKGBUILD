# Maintainer: wilke

_gemname=highline
pkgname="ruby-${_gemname}2"
pkgver=2.1.0
pkgrel=0
pkgdesc='A high-level command-line IO library.'
arch=(any)
url='https://github.com/JEG2/highline'
license=('GPL2')
depends=(ruby)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
sha256sums=('d63d7f472f8ffaa143725161ae6fb06895b5cb7527e0b4dac5ad1e4902c80cb9')
