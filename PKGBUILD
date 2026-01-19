# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-theme
pkgver=2.0.6
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
sha256sums=('e374ab3e18be6c17eb89229100556c3663f234777236f215088e56b4368cc70e')

build() {
	cd "${pkgname}"
	make
}

package() {
    cd "${srcdir}"/"${pkgname}"
    cp -r usr $pkgdir
}
