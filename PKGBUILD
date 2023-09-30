# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kjots
pkgver=5.1.1
pkgrel=2
pkgdesc='A note taking application for KDE'
url='https://www.kde.org/applications/utilities/kjots/'
arch=(x86_64)
license=(GPL)
depends=(akonadi
         akonadi-notes
         gcc-libs
         glibc
         grantlee
         kbookmarks5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         ki18n5
         kio5
         kitemmodels5
         kmime
         kontactinterface
         kparts5
         kpimtextedit
         kwidgetsaddons5
         ktextaddons
         kxmlgui5
         qt5-base)
makedepends=(extra-cmake-modules
             kdoctools5)
source=(https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('0f10f26aa1967ff99eaf247fdfd890971052e75fe2598eb6384cc89cd4b36092'
            'SKIP')
validpgpkeys=(D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF 
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
