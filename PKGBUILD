# Maintainer: ImFenyx <imfenyxdev@protonmail.com>
pkgname=omawrite
pkgver=0.5.0
pkgrel=1
pkgdesc='Dead-simple Markdown writing app built with Qt Quick'
arch=('x86_64')
url='https://github.com/omacom-io/omawrite'
license=('MIT' 'OFL-1.1')
depends=('hicolor-icon-theme' 'qt6-base' 'qt6-declarative' 'xdg-desktop-portal')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omacom-io/omawrite/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b57e418212f9bde0b8a12cff2424a43f15829a56a58fdc49542a0393a430f938')

build() {
  mkdir -p build
  cd build
  qmake6 "$srcdir/$pkgname-$pkgver/omawrite.pro"
  make
}

package() {
  install -Dm755 build/omawrite "$pkgdir/usr/bin/omawrite"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname-$pkgver/fonts/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 "$pkgname-$pkgver/pkgbuild/omawrite.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/omawrite.svg"
  install -Dm644 "$pkgname-$pkgver/pkgbuild/omawrite.desktop" "$pkgdir/usr/share/applications/omawrite.desktop"
}
