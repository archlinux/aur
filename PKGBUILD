# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kjots
pkgver=6.0.0
pkgrel=1
pkgdesc='A note taking application using Akonadi'
url='https://www.kde.org/applications/utilities/kjots/'
arch=(x86_64)
license=(GPL-2.0-or-later
         LGPL-2.0-or-later)
depends=(akonadi
         akonadi-notes
         gcc-libs
         glibc
         kbookmarks
         kcmutils
         kconfig
         kconfigwidgets
         kcoreaddons
         ki18n
         kio
         kitemmodels
         kmime
         kontactinterface
         kparts
         kpimtextedit
         kwidgetsaddons
         ktextaddons
         ktexttemplate
         kxmlgui
         libakonadi
         qt6-base)
makedepends=(extra-cmake-modules
             kdoctools
             ktextwidgets)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('3909cc6df5ebeeabe7c9086fc95b54dcd2a1cf5ee1683e0ad6ea799105b4eb08')
validpgpkeys=(D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF 
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
