# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=latte-dock
pkgver=0.10.9
pkgrel=4
pkgdesc='A dock based on Plasma Frameworks'
arch=(x86_64)
url='https://store.kde.org/p/1169519/'
license=(GPL)
depends=(knewstuff5
         plasma-framework5)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('32d1e554d095414db60102f19fc8ae955123e45f2ff3bde3bf38b67e390a487e'
            'SKIP')
validpgpkeys=(325E97C32E601F5D4EADCF3A55999050A2D9110E  # Michail Vourlakos (mvourlakos) <mvourlakos@gmail.com>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

build() {
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
