# Maintainer: zan <zan@420blaze.it>

pkgname=kontrast
pkgver=1.0.2
pkgrel=2
arch=(x86_64)
url='https://kde.org/applications/en/kontrast'
pkgdesc="Tool to check contrast for colors that allows verifying that your colors are correctly accessible"
license=(GPL)
groups=(kde-applications kde-accessibility)
depends=(kcoreaddons ki18n kirigami2 hicolor-icon-theme)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz") # {,.sig}
sha256sums=('bd7835e891dc969c6648d64812946ef46a280551f983b45dca4a05b39531dcf7')
#validpgpkeys=(14B0ED91B5783415D0AA1E0A06B35D38387B67BE) # Carl Schwan <carl@carlschwan.eu>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
