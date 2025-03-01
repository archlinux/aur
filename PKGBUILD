# Maintainer: Frank Villaro-Dixon <f@vi-di.fr>
# Old-Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=kdrive-bin
pkgver=3.6.9.20250220
pkgrel=1
pkgdesc='Infomaniak Drive desktop synchronization client (pre-compiled version)'
url='https://drive.infomaniak.com'
arch=(x86_64)
license=(GPL2)
source=(https://download.storage.infomaniak.com/drive/desktopclient/kDrive-$pkgver-amd64.AppImage
        kDrive.desktop
        kDrive.png)
sha256sums=('e4268ebaad7269202c35e5dffee6a243d38d7943fe6f862ddb7a9e81d123a0d1'
            'c4616b0ddbb137aef453f7031f5285b727addfa26f035a9ecbe62e1c6f195c5d'
            'b142e3a06de916f47e8666bddc74dfe37249616fd578ab9ae63b17a945d46813')
depends=(org.freedesktop.secrets # for session persistence
         fuse2)
conflicts=(kdrive)
provides=(kdrive)
options=(!strip)

package() {
  # App
  install -Dm755 kDrive-$pkgver-amd64.AppImage "$pkgdir"/usr/bin/kDrive

  # Desktop shortcut
  desktop-file-install --dir "$pkgdir"/usr/share/applications kDrive.desktop
  install -Dm644 kDrive.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/kDrive.png
}
