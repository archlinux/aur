# Maintainer: blekki <blekkiw at gmail dot com>
pkgname=ed-odyssey-materials-helper-bin
pkgver=2.223
pkgrel=1
pkgdesc="Elite Dangerous Odyssey Materials Helper"
arch=('x86_64')
url="https://github.com/jixxed/ed-odyssey-materials-helper"
license=('GPL-3.0')
source=(
  "https://github.com/jixxed/ed-odyssey-materials-helper/releases/download/$pkgver/Elite.Dangerous.Odyssey.Materials.Helper-$pkgver.linux.autoupdater.zip"
  "ed-odyssey-materials-helper-bin.desktop"
  "icon.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')
package() {
  cd "$srcdir"
  install -d "$pkgdir/opt/$pkgname/bin"
  install -d "$pkgdir/opt/$pkgname/lib"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -m755 "bin/Elite Dangerous Odyssey Materials Helper Launcher" "$pkgdir/opt/$pkgname/bin/Elite Dangerous Odyssey Materials Helper Launcher"
  cp -r lib/* "$pkgdir/opt/$pkgname/lib/"
  ln -s "/opt/$pkgname/bin/Elite Dangerous Odyssey Materials Helper Launcher" "$pkgdir/usr/bin/Elite Dangerous Odyssey Materials Helper Launcher"
  install -m644 "$srcdir/ed-odyssey-materials-helper-bin.desktop" "$pkgdir/usr/share/applications/"
  install -m644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ed-odyssey-materials-helper-bin.png"
}
