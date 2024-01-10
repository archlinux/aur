# Maintainer: wilke

_gemname=reckon
pkgname="ruby-${_gemname}"
pkgver=0.9.5
pkgrel=0
pkgdesc='Flexibly import bank account CSV files into Ledger for command-line accounting.'
arch=(any)
url='https://github.com/cantino/reckon'
license=(MIT)
depends=(ruby ruby-chronic ruby-highline ruby-rchardet ruby-matrix)
options=(!emptydirs)
source=("https://rubygems.org/downloads/reckon-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
sha256sums=('ca013baf8a8f96a0f2b0bf4c5eb0d7a9fc6f0d74c5d1fb7c81d945c340518130')
