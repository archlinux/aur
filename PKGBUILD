# Maintainer: NEOAPPS <asd22.info@gmail.com>
pkgname=libobsidianos_overlays-git
pkgver=r3.b74d866
pkgrel=1
pkgdesc="ObsidianOS's Overlay library for overlaying ObsidianOS Extensions without OverlayFS"
arch=('any')
url="https://github.com/Obsidian-OS/overlays"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cargo' 'rust')
provides=('libobsidianos_overlays')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/libobsidianos_overlays.so "$pkgdir/usr/lib/libobsidianos_overlays.so"
}
