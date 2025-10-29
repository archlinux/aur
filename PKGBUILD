# Maintainer: PiGames/Çınar Kuzey KUMANLI root_4rch@proton.me
pkgname=pacostrap-archiso
pkgver=0.9.0
pkgrel=1
pkgdesc="Arch Linux's Unofficial Offline Installation Helper Tool (For Arch Linux ISO)"
arch=('x86_64')
url="https://github.com/npc-gnu/pacostrap/tree/ArchISO_Edition"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'make')
source=("https://raw.githubusercontent.com/npc-gnu/pacostrap/ArchISO_Edition/pacostrap_ArchISO-0.9.0-PKGBUILD/pacostrap-0.9.0.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/pacostrap_ArchISO-$pkgver/build"
  make
}

package() {
  cd "$srcdir/pacostrap_ArchISO-$pkgver"

  install -Dm755 build/pacostrap "$pkgdir/usr/bin/pacostrap"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 pacostrap.png "$pkgdir/usr/share/pixmaps/pacostrap.png"
}

