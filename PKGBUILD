# Maintainer: Robert L Box <robertbox514@gmail.com>
pkgname=pe-bear-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Portable Executable reversing tool (binary release)"
arch=('x86_64')
url="https://github.com/hasherezade/pe-bear"
license=('custom')
depends=('qt6-base')
source=("https://github.com/hasherezade/pe-bear/releases/download/v${pkgver}/PE-bear_${pkgver}_qt6.4.2_x64_linux.tar.xz")
sha256sums=('d82501ece9b14d6fa98b9c9f50a71ac7cfbd6dc522bbab3815ba5340afd8a3b6')

package() {
  cd "$srcdir"

  # If the tarball has a top-level directory, enter it
  shopt -s nullglob
  dirs=("$srcdir"/PE-bear_*)
  if [[ -d "${dirs[0]}" ]]; then
    cd "${dirs[0]}"
  fi

  install -Dm755 bin/PE-bear "$pkgdir/usr/bin/PE-bear"
  install -Dm644 share/pixmaps/net.hasherezade.pe-bear.png \
    "$pkgdir/usr/share/pixmaps/net.hasherezade.pe-bear.png"
  install -Dm644 share/applications/net.hasherezade.pe-bear.desktop \
    "$pkgdir/usr/share/applications/net.hasherezade.pe-bear.desktop"
}

