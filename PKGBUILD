# Maintainer: wilke

_gemname=reckon
pkgname="ruby-${_gemname}"
pkgver=0.10.0
pkgrel=0
pkgdesc='Flexibly import bank account CSV files into Ledger for command-line accounting.'
arch=(any)
url='https://github.com/cantino/reckon'
license=(MIT)
depends=(ruby ruby-chronic ruby-highline2 ruby-rchardet ruby-matrix)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
sha256sums=('c2b73a0fadab430469f059b4a5ed5d70561824a34d063bbfab777cfc1a5e6a7e')
