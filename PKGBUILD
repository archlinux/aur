# Maintainer: Jeinzi <jeinzi at gmx dot de>
# Contributer: Maato <maato at softwarebakery dot com>

pkgname='thunar-dropbox'
pkgver=0.3.1
pkgrel=1
pkgdesc="Plugin for Thunar that adds context-menu items for Dropbox."
arch=('i686' 'x86_64')
url="https://github.com/Jeinzi/thunar-dropbox"
license=('GPL3')
depends=('thunar')
makedepends=("git" "cmake")
source=("$pkgname-$pkgver.zip::https://github.com/Jeinzi/thunar-dropbox/archive/$pkgver.zip")
sha256sums=('c9692bb8f88451d92ae35b30586351eab0af3adb6ba59c47c16a22304409adec')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" .
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake --build build --target install --config Release
}
