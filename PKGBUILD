# Maintainer: Jeinzi <jeinzi at gmx dot de>
# Contributer: Maato <maato at softwarebakery dot com>

pkgname='thunar-dropbox'
pkgver=0.3.2
pkgrel=1
pkgdesc="Plugin for Thunar that adds context-menu items for Dropbox."
arch=('i686' 'x86_64')
url="https://github.com/Jeinzi/thunar-dropbox"
license=('GPL3')
depends=('thunar')
makedepends=("git" "cmake")
source=("$pkgname-$pkgver.zip::https://github.com/Jeinzi/thunar-dropbox/archive/$pkgver.zip")
sha256sums=('2740153fd77e3a15fb8c8cd73a272c8c15efe710559cf7a8542b0fea2c3987be')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" .
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake --build build --target install --config Release
}
