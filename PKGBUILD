# Maintainer: James H <james@jamesmcmahon.co.uk>
pkgname=linear-electron
pkgver=0.1.1
pkgrel=1
pkgdesc='Unofficial Linear desktop app (linear-electron)'
arch=('x86_64' 'aarch64')
url='https://github.com/hughesjs/linear-electron'
license=('MIT' 'LicenseRef-Linear-Brand')
conflicts=(linear-electron-git linear-electron-bin linear-electron-appimage )
options=('!strip' '!debug')
depends=('electron44' 'xdg-utils')
makedepends=('jq')
source=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.1/linear-electron-0.1.1.tar.gz)
sha256sums=(b2ee385ba00b291a043d4d329e50a59393ed64fecf0f9785cc786c4fd94b9482)

package() {
  cd "linear-electron-$pkgver"
  bash scripts/stage-app.sh "$pkgdir/usr/lib/linear-electron" "$pkgver"
  install -Dm755 packaging/linear-electron-system "$pkgdir/usr/bin/linear-electron"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/linear-electron.desktop "$pkgdir/usr/share/applications/linear-electron.desktop"
  install -Dm644 packaging/linear-electron.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/linear-electron.png"
  install -Dm644 packaging/LINEAR-BRAND-NOTICE "$pkgdir/usr/share/licenses/$pkgname/LINEAR-BRAND-NOTICE"
}
