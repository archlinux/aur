# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-theme
pkgver=1.9.7
pkgrel=1
pkgdesc='A collection of legacy mint themes.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
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
    'mint-y-icons'
    'mint-x-icons'
)
provides=(mint-themes-legacy)
conflicts=(
    'mint-x-theme'
    'mint-y-theme'
    'mint-cinnamon-themes'
    'mint-themes-legacy'
)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('171f6071179fe8bd585491b5a417642b6a5d38e14b69592571258bc05ba98cd3')

build() {
	cd "${pkgname}"
	make
}

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr $pkgdir
}
