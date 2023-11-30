# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular
pkgver=24.01.80
pkgrel=1
pkgdesc='Document Viewer'
arch=(x86_64)
url='https://apps.kde.org/okular/'
license=(GPL LGPL FDL)
depends=(discount
         djvulibre
         freetype2
         gcc-libs
         glibc
         kactivities5
         karchive5
         kbookmarks5
         kcodecs5
         kcompletion5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kcrash5
         ki18n5
         kio5
         kitemviews5
         kjobwidgets5
         kparts5
         kpty5
         ktextwidgets5
         kwallet5
         kwidgetsaddons5
         kwindowsystem5
         kxmlgui5
         libjpeg-turbo
         libkexiv2-qt5
         libspectre
         libtiff
         phonon-qt5
         poppler-qt5
         purpose5
         qt5-base
         qt5-declarative
         qt5-speech
         qt5-svg
         qt5-x11extras
         threadweaver5
         zlib)
makedepends=(chmlib
             ebook-tools
             extra-cmake-modules
             kdegraphics-mobipocket5
             kdoctools5
             khtml)
optdepends=('calligra: ODT and ODP support'
            'chmlib: CHM support'
            'ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket5: mobi support'
            'khtml: CHM support'
            'libzip: CHM support'
            'unarchiver: Comic Book Archive support (alternative)'
            'unrar: Comic Book Archive support')
groups=(kde-applications
        kde-graphics)
source=(https://download.kde.org/unstable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('0227f453b7b686d07bd92118f04672cfcfac88f2d1831c66b96b83c32900a3ce'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(!zipman)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
