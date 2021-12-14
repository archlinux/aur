# Maintainer: Alexander Rosenberg <zanderpkg at pm dot me>

pkgname=practice-timer
pkgver=1
pkgrel=1
pkgdesc="Track and analyze statistics about how long you do various activities"
url="https://gitlab.com/zander671/practice-timer"
arch=('x86_64')
license=('GPL3')
depends=('gtk3')
makedepends=('cmake' 'make' 'git')
optdepends=('plotutils: graphs in the statistics window')
source=("git+https://gitlab.com/zander671/practice-timer.git")
sha256sums=('SKIP')

pkgver(){
  cd "$pkgname"
  git rev-list --count HEAD
}

build() {
  cd "$pkgname"
  cmake -B build
  make -C build
}

package() {
  cd "$pkgname"
  install -m755 -D build/Practice_Timer "$pkgdir/usr/bin/practice-timer"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D tools/linux/practice-timer.xpm "$pkgdir/usr/share/pixmaps/practice-timer.xpm"
  install -m644 -D tools/linux/practice-timer.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/practice-timer.png"
  install -m644 -D tools/linux/practice-timer.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/practice-timer.svg"
  install -m644 -D tools/linux/practice-timer.desktop "$pkgdir/usr/share/applications/practice-timer.desktop"
}
