# Maintainer: Emilien Devos <contact@emiliendevos.be>
pkgname=harmony-player
pkgver=0.7.0
pkgrel=1
pkgdesc="A next-gen music player built with Electron."
arch=('x86_64')
url="http://getharmony.xyz/"
license=('')
groups=()
depends=('gnuplot' 'gconf' 'libxss' 'libxtst' 'alsa-lib' 'nss' 'gtk2')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("harmony-$pkgver.tar.xz::https://github.com/vincelwt/harmony/releases/download/v$pkgver/harmony-$pkgver-x64.tar.xz"
        "Harmony.desktop"
        "harmony-16.png"
        "harmony-32.png"
        "harmony-256.png"
        "harmony")
md5sums=('8c05ee0ce8e98ec92d39ab14c334b9f1'
         '776af71320e401646bf96a7d4c721d27'
         '9ff4e602debeaf6d88c625189342db52'
         'd3ff15f6c1dd18a81a933242aae9c892'
         '0df74ddd513dbea8d1fb130c4232bd73'
         '6fc9e4c549c010f948f0ec5906c52983')

package() {
  cd "harmony-$pkgver"

  mkdir -p "$pkgdir/opt/Harmony"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  cp -r * "$pkgdir/opt/Harmony/"

  cp "$srcdir/harmony" "$pkgdir/usr/bin/Harmony"
  cp "$srcdir/Harmony.desktop" "$pkgdir/usr/share/applications/"
  cp "$srcdir/harmony-16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/harmony.png"
  cp "$srcdir/harmony-32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/harmony.png"
  cp "$srcdir/harmony-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/harmony.png"
}
