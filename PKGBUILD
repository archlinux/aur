# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-theme
pkgver=1.9.8
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
sha256sums=('1c1d2e0716d42936dc8a38802099de027a07eda173b66d52c40d4ff9c274e674')

build() {
	cd "${pkgname}"
	make
}

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr $pkgdir
}
