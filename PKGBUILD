# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=vera-xsettings-git
_pkgname=vera-xsettings
pkgver=1.0.2.r21.g0c38f4b
pkgrel=1
epoch=
pkgdesc="a reference of the xsettings spec made for vera-desktop-environment"
arch=('x86_64' 'i686')
url="https://github.com/vera-desktop/vera-xsettings"
license=('GPL2.1')
depends=(vala)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(vera-xsettings::git+https://github.com/vera-desktop/vera-xsettings.git#branch=debian)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo "1.0.2.r$(git rev-list --count HEAD).g$(git log -1 --format="%h")"
  }
build() {
    cd "vera-xsettings"
    bake --configure install-directory="$pkgdir/"
}

package() {
    cd "vera-xsettings"
    bake install
}
