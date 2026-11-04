# Maintainer: Marco R. <thomasschmidt45 at gmx dot net>
pkgname=kommunicator
pkgver=0.1
pkgrel=1
pkgdesc="Kirigami Client for Nextcloud Talk"
arch=('any')
url="https://codeberg.org/lubuwest/Kommunicator"
license=('GPL3')
makedepends=('cmake')
depends=('qt6-base' 'extra-cmake-modules' 'kconfigwidgets' 'kwindowsystem' 'kio' 'kirigami' 'qtkeychain-qt6' 'qt6-svg' 'knotifications' 'kitemmodels')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/lubuwest/Kommunicator/archive/v${pkgver}.tar.gz")
md5sums=('ee8fa0e14a37ec5e540e9fa16e49f121') #generate with 'makepkg -g'

build() {
  cmake -B build -S "kommunicator" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr'
  cd build
  make
}

package() {
  install -Dm755 "$srcdir"/build/bin/kommunicator "$pkgdir"/usr/bin/kommunicator
  install -Dm644 "$srcdir"/kommunicator/de.manic.kommunicator.desktop "$pkgdir"/usr/share/applications/de.manic.kommunicator.desktop
  install -Dm644 "$srcdir"/kommunicator/icons/scalable/de.manic.kommunicator.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/de.manic.kommunicator.svg
}


# vim:set ts=2 sw=2 et:
