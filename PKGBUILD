# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

_pkgname=dragon
pkgname=dragon-drag-and-drop
pkgver=1.1.1
pkgrel=1
pkgdesc='Simple drag-and-drop source/sink for X'
arch=('i686' 'x86_64')
url='https://github.com/mwh/dragon'
license=('GPL3')
depends=('gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mwh/dragon/archive/v${pkgver}.tar.gz")
sha256sums=('010a508c539c35bd128c54bbe57ad7c17c078e1b95e7bd3457a8589973e0b171')

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -m755 -D dragon "$pkgdir/usr/bin/${pkgname%-git}"
}
