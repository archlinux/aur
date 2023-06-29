# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-l-theme
pkgver=1.9.4
pkgrel=1
pkgdesc='A collection of legacy mint themes.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL3)
depends=(
    ttf-ubuntu-font-family
)
makedepends=(
    gtk3
    inkscape
    optipng
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
sha256sums=('ad0f2f7370e0866c4d48317d0102def9124e056fe0a7e8bd34c39bfb69244d73')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}
