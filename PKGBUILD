# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn
pkgver=2.0
pkgrel=1
pkgdesc="The fastest terminal file manager ever written."
arch=("i686" "x86_64")
depends=("ncurses" "readline")
makedepends=("pkgconf")
url="https://github.com/jarun/nnn"
license=('CUSTOM')
source=("https://github.com/jarun/nnn/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('0029efd3d009c197b1646d260350f3f87edca76eef3be6b81846af133d58d6a9')

package() {
  pkg_loc="${pkgname}-${pkgver}"
  make -C $pkg_loc DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 "$pkg_loc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
