# Maintainer: James H <james@jamesmcmahon.co.uk>
pkgname=linear-electron-appimage
pkgver=0.1.1
pkgrel=1
pkgdesc='Unofficial Linear desktop app (linear-electron-appimage)'
arch=('x86_64' 'aarch64')
url='https://github.com/hughesjs/linear-electron'
license=('MIT' 'LicenseRef-Linear-Brand' 'LicenseRef-Electron-Chromium')
provides=("linear-electron=$pkgver")
conflicts=(linear-electron linear-electron-git linear-electron-bin )
options=('!strip' '!debug')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libxrandr' 'libxkbcommon' 'libdrm' 'mesa' 'libnotify' 'xdg-utils' 'fuse3')
source_x86_64=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.1/linear-electron-x86_64-v0.1.1.AppImage)
sha256sums_x86_64=(c637fbe288d84290907e5b44bb95ad9a9adb36334caed32dcdcc38c3abb58734)
source_aarch64=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.1/linear-electron-aarch64-v0.1.1.AppImage)
sha256sums_aarch64=(700a0bf053e4f2250dfb099ee9979870b9933a58fde69e271e6674958bac9183)
source=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.1/linear-electron-0.1.1.tar.gz)
sha256sums=(b2ee385ba00b291a043d4d329e50a59393ed64fecf0f9785cc786c4fd94b9482)
noextract=('linear-electron-x86_64-v0.1.1.AppImage' 'linear-electron-aarch64-v0.1.1.AppImage')

package() {
  install -Dm755 "linear-electron-$CARCH-v$pkgver.AppImage" "$pkgdir/opt/linear-electron/linear-electron.AppImage"
  cd "linear-electron-$pkgver"
  install -Dm755 packaging/linear-electron-appimage "$pkgdir/usr/bin/linear-electron"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/linear-electron.desktop "$pkgdir/usr/share/applications/linear-electron.desktop"
  install -Dm644 packaging/linear-electron.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/linear-electron.png"
  install -Dm644 packaging/LINEAR-BRAND-NOTICE "$pkgdir/usr/share/licenses/$pkgname/LINEAR-BRAND-NOTICE"
}
