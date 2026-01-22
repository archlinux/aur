pkgname=myrient
pkgver=1.1.5
pkgrel=1
pkgdesc="Bulk downloader and extractor for ROM archive directories"
arch=('x86_64')
url="https://github.com/cruzisonfire/myrient"
license=('GPL3')
depends=('qt6-base' 'aria2' 'wget' 'unzip' 'p7zip')
optdepends=('unrar: RAR archive extraction support')
makedepends=('git' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f901d61e15de8052525598c128154f6e2168d7d4d17eff9cd3d64516da571783')

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
