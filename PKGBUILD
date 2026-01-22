pkgname=myrient
pkgver=1.1.6
pkgrel=1
pkgdesc="Bulk downloader and extractor for ROM archive directories"
arch=('x86_64')
url="https://github.com/cruzisonfire/myrient"
license=('GPL3')
depends=('qt6-base' 'aria2' 'wget' 'unzip' 'p7zip')
optdepends=('unrar: RAR archive extraction support')
makedepends=('git' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9ceae43319afb4c5f900ebb450388cd1f8e5a3e55d4845022249601cc5eabfeb')

build() {
  cd "$pkgname-$pkgver"
  qmake6 myrient.pro
  make
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 myrient "$pkgdir/usr/bin/myrient"

  # Install desktop file and icon
  install -Dm644 myrient.desktop "$pkgdir/usr/share/applications/myrient.desktop"
  install -Dm644 myrient.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/myrient.png"
}
