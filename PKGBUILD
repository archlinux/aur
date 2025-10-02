# Maintainer: Vojtěch Sajdl <vojtech@sajdl.com>
# Contributor: liolok <aur@liolok.com>
_name="middleclickclose"

pkgname="gnome-shell-extension-${_name}"
pkgver=35
pkgrel=1
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="https://github.com/p91paul/middleclickclose"
license=('GPL2')
depends=("gnome-shell")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d18297fbfc54026429f74a134f1618bc8059b3a2d3a11177eb2f2c2236b63b1a')
conflicts=('gnome-shell-extension-middleclickclose-git')

build() {
    cd "${srcdir}/${_name}-${pkgver}/"

    make pack
}

package() {
  cd "${srcdir}/${_name}-${pkgver}/"

  make install-system PREFIX="$pkgdir/usr"
}
