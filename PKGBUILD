# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-theme
pkgver=2.0.1
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
sha256sums=('88b4fb3af400b09af456e2fdfab4c59ee7fdf1e04da08b6dd8aa608f9950862d')

build() {
	cd "${pkgname}"
	make
}

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr $pkgdir
}
