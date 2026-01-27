# Maintainer: barry <howtoedittv@gmail.com>

pkgname=android-debug-tools
pkgver=34.0.0
pkgrel=1
pkgdesc="Android SDK Platform Tools: adb and fastboot"
arch=('x86_64')
url="https://developer.android.com/studio/releases/platform-tools"
license=('Apache')
depends=('unzip' 'wget')
makedepends=()
source=("https://dl.google.com/android/repository/platform-tools-latest-linux.zip")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/android-debug-tools"

  unzip -q "$srcdir/platform-tools-latest-linux.zip" -d "$srcdir"

  install -Dm755 "$srcdir/platform-tools/adb" "$pkgdir/usr/bin/adb"
  install -Dm755 "$srcdir/platform-tools/fastboot" "$pkgdir/usr/bin/fastboot"

  cp -r "$srcdir/platform-tools/"* "$pkgdir/usr/share/android-debug-tools/"

  rm -rf "$srcdir/platform-tools"
}
