# Maintainer: Vojtěch Sajdl <vojtech@sajdl.com>
# Contributor: liolok <aur@liolok.com>
_name="middleclickclose"

pkgname="gnome-shell-extension-${_name}"
pkgver=36
pkgrel=1
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="https://github.com/p91paul/middleclickclose"
license=('GPL2')
depends=("gnome-shell")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5a9c57c767c5b5552cfde0997debd246f1bcdaabe96077e0ec4c9477ee41a397')
conflicts=('gnome-shell-extension-middleclickclose-git')

build() {
    cd "${srcdir}/${_name}-${pkgver}/"

    make pack
}

package() {
  cd "${srcdir}/${_name}-${pkgver}/"

  make install-system PREFIX="$pkgdir/usr"
}
