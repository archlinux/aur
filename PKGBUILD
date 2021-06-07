# Forked form https://aur.archlinux.org/packages/android-ndk-16b/ by Oscar Morante <spacepluk@gmail.com>

pkgname=android-ndk-16b-opt
_pkg=android-ndk
pkgver=r16_b
pkgrel=4
pkgdesc="Android C/C++ developer kit. Don't override package \`android-ndk\`"
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
provides=('android-ndk')
replaces=('android-ndk64')
depends=('ncurses5-compat-libs')
source=("http://dl.google.com/android/repository/$_pkg-${pkgver/_/}-linux-x86_64.zip")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/opt"
  mv "$_pkg-${pkgver/_/}" "$pkgdir/opt/$_pkg-16b"

  # Fix permissions
  chmod -R o=g "$pkgdir/opt/$_pkg-16b"
  find "$pkgdir/opt/$_pkg-16b" -perm 744 -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
