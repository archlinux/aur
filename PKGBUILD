# Maintainer: blekki <blekkiw at gmail dot com>
pkgname=ed-odyssey-materials-helper-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="Elite Dangerous Odyssey Materials Helper"
arch=('x86_64')
url="https://github.com/jixxed/ed-odyssey-materials-helper"
license=('custom:EULA')
source=(
  "https://github.com/jixxed/ed-odyssey-materials-helper/releases/download/$pkgver/Elite.Dangerous.Odyssey.Materials.Helper-$pkgver.linux.autoupdater.zip"
  "ed-odyssey-materials-helper-bin.desktop"
  "icon.png"
  "https://raw.githubusercontent.com/jixxed/ed-odyssey-materials-helper/$pkgver/EULA.MD"
)
sha256sums=('d90b861de022bce20c4747ef2c099c3239440936a9e2585d1a9806de95a0080c'
            '0bf625dde338c79ce065cfc65076dd235e39e9d6885140bcaace35c644f85475'
            '1e39aba98b92f8d9fcedb15b4ca8b1574e710ca3caf81473fac4745041cc6129'
            'a1af8aa279188ee356d742aace1f2fc45c591b87ca66e777920e2673878de4e7')
package() {
  cd "$srcdir"
  install -d "$pkgdir/opt/$pkgname/bin"
  install -d "$pkgdir/opt/$pkgname/lib"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 "bin/Elite Dangerous Odyssey Materials Helper Launcher" "$pkgdir/opt/$pkgname/bin/Elite Dangerous Odyssey Materials Helper Launcher"
  cp -r lib/* "$pkgdir/opt/$pkgname/lib/"
  ln -s "/opt/$pkgname/bin/Elite Dangerous Odyssey Materials Helper Launcher" "$pkgdir/usr/bin/Elite Dangerous Odyssey Materials Helper Launcher"
  install -m644 "$srcdir/ed-odyssey-materials-helper-bin.desktop" "$pkgdir/usr/share/applications/"
  install -m644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ed-odyssey-materials-helper-bin.png"
  install -m644 "$srcdir/EULA.MD" "$pkgdir/usr/share/licenses/$pkgname/EULA.MD"
}
