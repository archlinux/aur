# Maintainer: Marco Sarti <marco@elogiclab.com>
pkgname=flowkeeper-bin
pkgver=v0.9.1
pkgrel=1
pkgdesc='Independent Pomodoro Technique desktop timer for power users (pre-compiled version)'
url='https://flowkeeper.org/'
arch=(x86_64)
license=(GPL-3.0-only)
source=(https://github.com/flowkeeper-org/fk-desktop/releases/download/$pkgver/Flowkeeper
        flowkeeper.desktop
        flowkeeper.png)
sha256sums=('1c2106ecb48cee1d98cfa05bbd0d0a7667d89ca64e1be4d9c4cbc4e68f206220'
            'adef0e06f94b20a5f05c6053cabec2439fe50eb49e5caa69b8c786fdca2ccafe'
            'af9d56c1671dea6927d8194f3c303d8b544673818f0dce46c114d6a74ebf60b9')
depends=(hicolor-icon-theme glibc zlib)
conflicts=(flowkeeper)
provides=(flowkeeper)
options=(!strip)

package() {
  # App
  install -Dm755 Flowkeeper "$pkgdir"/usr/bin/flowkeeper

  # Desktop shortcut
  desktop-file-install --dir "$pkgdir"/usr/share/applications flowkeeper.desktop
  install -Dm644 flowkeeper.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/flowkeeper.png
}
