# Maintainer: Vojtěch Sajdl <vojtech@sajdl.com>
# Contributor: liolok <aur@liolok.com>
_name="middleclickclose"

pkgname="gnome-shell-extension-${_name}"
pkgver=33
pkgrel=1
pkgdesc='Gnome shell extension for closing apps in overview with a middle click'
arch=('any')
url="https://github.com/p91paul/middleclickclose"
license=('GPL2')
depends=("gnome-shell")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c58d102a3cab1759c46b77d09c0635051360f89c403faa76e90046c05b786f5b')
conflicts=('gnome-shell-extension-middleclickclose-git')

build() {
    cd "${srcdir}/${_name}-${pkgver}/"

    make pack
}

package() {
  cd "${srcdir}/${_name}-${pkgver}/"

  make install-system PREFIX="$pkgdir/usr"
}
