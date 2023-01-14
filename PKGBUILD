# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=pacup-arch
pkgver=1.0
pkgrel=2
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
sha512sums=('4b8cfd1baf27db859f65450d5b5ce970f47c9ed4cf54d1d670a140a736fe2014e4192c151adb18838c7654e9479061e6ea01f4587aa7b55a68ac24d8538dcd2a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
}
