# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-theme
pkgver=2.0.0
pkgrel=1
pkgdesc='A collection of legacy mint themes.'
arch=('any')
url="https://github.com/linuxmint/mint-l-theme"
_url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
    'ttf-ubuntu-font-family'
)
makedepends=(
    'python'
    'sassc'
)
optdepends=(
    'mint-l-icons'
)
options=('!strip')
source=("${pkgname}_${pkgver}.tar.xz::${_url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('2b2f5ee714effb86b3e8b12acd7215023c3431976b99e3b5af0f052bafc6172d')

build() {
	cd "${pkgname}"
	make
}

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr $pkgdir
}
