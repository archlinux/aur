# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=pacup-arch
pkgver=1.1
pkgrel=1
pkgdesc="Simplify Pacman, Flatpak Snap, and AUR package updating."
arch=('any')
url="https://github.com/Jin-Asanami/pacup-arch"
license=('GPL3')
depends=('bash')
optdepends=(
  'flatpak: for Flatpak support'
  'snapd: for Snap support'
  'yay: for AUR support'
  'paru: for AUR support'
  'pacaur: for AUR support'
  'pikaur: for AUR support'
  'aura: for AUR support'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('8a73182017be6baa28ff72ecfcfa7a942edead275a6a16c6906b029c80254b52cd9964bbd38a7f734a334ac8855ec80d18b39a83ca05cf2ca730aac18ccc038c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
}
