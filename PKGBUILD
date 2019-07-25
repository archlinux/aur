# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

_pkgname=dragon
pkgname=dragon-drag-and-drop
pkgver=1.1.0
pkgrel=1
pkgdesc='Simple drag-and-drop source/sink for X'
arch=('i686' 'x86_64')
url='https://github.com/mwh/dragon'
license=('GPL3')
depends=('gtk3')
makedepends=('git')
source=("https://github.com/mwh/dragon/archive/v${pkgver}.tar.gz")
sha256sums=('4591795e788d5f10d26b1f0e1c2e70b6ae331a8382ae18a4b2486c382c4d62f0')

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -m755 -D dragon "$pkgdir/usr/bin/${pkgname%-git}"
}
