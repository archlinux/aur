# Maintainer: Andre Kugland <kugland@gmail.com>
pkgname=notable-bin
pkgver=1.8.4
pkgrel=5
epoch=
pkgdesc="The markdown-based note-taking app that doesn't suck"
arch=('x86_64')
url="https://github.com/notable/notable"
license=('Freeware')
groups=()
depends=('libxss')
makedepends=()
checkdepends=()
optdepends=()
provides=('notable')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/notable/notable/releases/download/v${pkgver}/notable-${pkgver}.pacman")
noextract=()
sha512sums=('a05a79d180f29562eefc7717ff5c3d52a1465c8a18be3766f138a2aeec0d268ed72d0de4ee9cd7747b19e30a3ef344e4f8bdeb755118a39a22193d5d6e213dd2')
validpgpkeys=()

package() {
  # Work around for https://github.com/electron/electron/issues/17972
  chmod 4755 opt/Notable/chrome-sandbox

  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/

  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
