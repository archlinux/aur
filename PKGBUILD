# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=libksysguard
pkgname=libksysguard-light
pkgver=5.19.2
pkgrel=1
pkgdesc='Libraries for ksysguard to retrieve information on the current status of computer hardware without the big dependency on qt5-webengine'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(libxres knewstuff kdeclarative)
makedepends=(extra-cmake-modules kdoctools plasma-framework)
groups=(plasma)
conflicts=(libksysguard)
replaces=(libksysguard)
provides=(libksysguard)
source=("https://download.kde.org/stable/plasma/$pkgver/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('c44561f6a260eebdce852274fb23323cc2c7f1181a2c000fc14c982ee0ebe736'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
