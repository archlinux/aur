# Maintainer: James H <james@jamesmcmahon.co.uk>
pkgname=linear-electron-appimage
pkgver=0.2.0
pkgrel=1
pkgdesc='Unofficial Linear desktop app (linear-electron-appimage)'
arch=('x86_64' 'aarch64')
url='https://github.com/hughesjs/linear-electron'
license=('MIT' 'LicenseRef-Linear-Brand' 'LicenseRef-Electron-Chromium')
provides=("linear-electron=$pkgver")
conflicts=(linear-electron linear-electron-git linear-electron-bin )
options=('!strip' '!debug')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libxrandr' 'libxkbcommon' 'libdrm' 'mesa' 'libnotify' 'xdg-utils' 'fuse3')
source_x86_64=(https://github.com/hughesjs/linear-electron/releases/download/v0.2.0/linear-electron-x86_64-v0.2.0.AppImage)
sha256sums_x86_64=(45583685965d97560dd7c77b1ebc05eafd7e43ec25c981a2a07215fa51dab411)
source_aarch64=(https://github.com/hughesjs/linear-electron/releases/download/v0.2.0/linear-electron-aarch64-v0.2.0.AppImage)
sha256sums_aarch64=(c3fe41708807662055f605fd470eef61a7ef82dbaf205073a81c1615aea69c4c)
source=(https://github.com/hughesjs/linear-electron/releases/download/v0.2.0/linear-electron-0.2.0.tar.gz)
sha256sums=(dc28326fbe74aa99f873d7b7feb2ac2a6cf8e64976bcefa4c1d647df730716f9)
noextract=('linear-electron-x86_64-v0.2.0.AppImage' 'linear-electron-aarch64-v0.2.0.AppImage')

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
