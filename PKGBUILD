# Maintainer: James H <james@jamesmcmahon.co.uk>
pkgname=linear-electron-appimage
pkgver=0.1.0
pkgrel=1
pkgdesc='Unofficial Linear desktop app (linear-electron-appimage)'
arch=('x86_64' 'aarch64')
url='https://github.com/hughesjs/linear-electron'
license=('MIT' 'LicenseRef-Electron-Chromium')
provides=("linear-electron=$pkgver")
conflicts=(linear-electron linear-electron-git linear-electron-bin )
options=('!strip' '!debug')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libxrandr' 'libxkbcommon' 'libdrm' 'mesa' 'libnotify' 'xdg-utils' 'fuse3')
source_x86_64=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.0/linear-electron-x86_64-v0.1.0.AppImage)
sha256sums_x86_64=(f174d075d19737211c3441b679dd89fc9dbd820a1a8ea023524e02caa97eea03)
source_aarch64=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.0/linear-electron-aarch64-v0.1.0.AppImage)
sha256sums_aarch64=(dc3d13c690b7787ca4a82cc9bda269576ec8ea0ebbfb04500e9d08feedadfdbd)
source=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.0/linear-electron-0.1.0.tar.gz)
sha256sums=(61199216df863f0d7d43c5982e4e9ad58537a306362c4d2c8337891ccff00911)
noextract=('linear-electron-x86_64-v0.1.0.AppImage' 'linear-electron-aarch64-v0.1.0.AppImage')

package() {
  install -Dm755 "linear-electron-$CARCH-v$pkgver.AppImage" "$pkgdir/opt/linear-electron/linear-electron.AppImage"
  cd "linear-electron-$pkgver"
  install -Dm755 packaging/linear-electron-appimage "$pkgdir/usr/bin/linear-electron"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/linear-electron.desktop "$pkgdir/usr/share/applications/linear-electron.desktop"
  install -Dm644 packaging/linear-electron.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/linear-electron.svg"
}
