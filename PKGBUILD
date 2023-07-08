# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-theme
pkgver=1.9.5
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
sha256sums=('4e40be25ecb67b980270f3ffe41fd7022074bdeffc4df1452bb8423bade986c3')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}
