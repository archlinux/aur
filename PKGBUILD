# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-theme
pkgver=2.0.10
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
    'python-libsass'
)
optdepends=(
    'mint-l-icons'
)
options=('!strip')
source=("${pkgname}_${pkgver}.tar.xz::${_url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('e3c2b69ee1469d5dd6f6e3b23c7f004b196400b5bed86e6a90ac9274b4b37262')

build() {
	cd "${pkgname}"
	make
}

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr $pkgdir
}
