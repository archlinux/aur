# Maintainer: James H <james@jamesmcmahon.co.uk>
pkgname=linear-electron
pkgver=0.1.0
pkgrel=1
pkgdesc='Unofficial Linear desktop app (linear-electron)'
arch=('x86_64' 'aarch64')
url='https://github.com/hughesjs/linear-electron'
license=('MIT')
conflicts=(linear-electron-git linear-electron-bin linear-electron-appimage )
options=('!strip' '!debug')
depends=('electron44' 'xdg-utils')
makedepends=('jq')
source=(https://github.com/hughesjs/linear-electron/releases/download/v0.1.0/linear-electron-0.1.0.tar.gz)
sha256sums=(61199216df863f0d7d43c5982e4e9ad58537a306362c4d2c8337891ccff00911)

package() {
  cd "linear-electron-$pkgver"
  bash scripts/stage-app.sh "$pkgdir/usr/lib/linear-electron" "$pkgver"
  install -Dm755 packaging/linear-electron-system "$pkgdir/usr/bin/linear-electron"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/linear-electron.desktop "$pkgdir/usr/share/applications/linear-electron.desktop"
  install -Dm644 packaging/linear-electron.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/linear-electron.svg"
}
