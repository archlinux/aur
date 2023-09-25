# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

_pkgname=dragon
pkgname=dragon-drop
pkgver=1.2.0
pkgrel=2
pkgdesc='Simple drag-and-drop source/sink for X or Wayland'
arch=('i686' 'x86_64')
url='https://github.com/mwh/dragon'
license=('GPL3')
depends=('gtk3')
conflicts=('dragon-drag-and-drop')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mwh/dragon/archive/v${pkgver}.tar.gz")
sha256sums=('9bda28e96d715c759c8a1db754bdfde5e7d83671e13cd25a892f6b5e29357994')

build() {
  cd "${_pkgname}-${pkgver}"
  make NAME=${pkgname}
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr" PREFIX='' NAME=${pkgname} install
}
