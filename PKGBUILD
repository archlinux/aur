# Maintainer: blekki <blekkiw at gmail dot com>
pkgname=ed-odyssey-materials-helper-bin
pkgver=2.118
pkgrel=1
pkgdesc="Elite Dangerous Odyssey Materials Helper"
arch=('x86_64')
url="https://github.com/jixxed/ed-odyssey-materials-helper"
license=('custom')
source=(
  "https://github.com/jixxed/ed-odyssey-materials-helper/releases/download/$pkgver/Elite.Dangerous.Odyssey.Materials.Helper-$pkgver.portable.linux.zip"
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
  install -m755 "bin/Elite Dangerous Odyssey Materials Helper" "$pkgdir/opt/$pkgname/bin/EliteDangerousOdysseyMaterialsHelper"
  cp -r lib/* "$pkgdir/opt/$pkgname/lib/"
  ln -s "/opt/$pkgname/bin/EliteDangerousOdysseyMaterialsHelper" "$pkgdir/usr/bin/EliteDangerousOdysseyMaterialsHelper"
  mv "$pkgdir/opt/$pkgname/lib/app/Elite Dangerous Odyssey Materials Helper.cfg" "$pkgdir/opt/$pkgname/lib/app/EliteDangerousOdysseyMaterialsHelper.cfg"
  install -m644 "$srcdir/ed-odyssey-materials-helper-bin.desktop" "$pkgdir/usr/share/applications/"
  install -m644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ed-odyssey-materials-helper-bin.png"
}
