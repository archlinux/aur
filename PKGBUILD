# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-theme
pkgver=1.9.6
pkgrel=1
pkgdesc='A collection of legacy mint themes.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL3)
depends=(
    ttf-ubuntu-font-family
)
makedepends=(
    python
    sassc
)
optdepends=(
    mint-l-icons
    mint-y-icons
    mint-x-icons
)
provides=(mint-themes-legacy)
conflicts=(
    mint-x-theme
    mint-y-theme
    mint-cinnamon-themes
    mint-themes-legacy
)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('5b8ae3f2089996636b65d2804cedcd48e80e092884a885d84bc98388766bf480')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}
