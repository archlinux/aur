# Maintainer: wilke

_gemname=reckon
pkgname="ruby-${_gemname}"
pkgver=0.9.6
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
sha256sums=('c4c16d69f799f40227e1a2c14ddf668f8ac03d2c04eeb6af29969b2fdc1143a8')
