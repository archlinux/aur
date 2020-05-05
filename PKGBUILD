# Maintainer:  Jah Way <jahway603 at protonmail dot com>

# from the official repos:
# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: frownlee <florez.brownlee@gmail.com>

_pkg=android-ndk
pkgname=android-ndk-20b
pkgver=r20b
pkgrel=1
pkgdesc='Android C/C++ developer kit'
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=("etc/profile.d/android-ndk.sh")
install="android-ndk.install"
provides=('android-ndk')
conflicts=('android-ndk')
replaces=('android-ndk64')
depends=('glibc')
source=('android-ndk.sh')
source_x86_64=("https://dl.google.com/android/repository/android-ndk-$pkgver-linux-x86_64.zip")
sha256sums=('2068618bc3e99149310f544be5d639ae183dc767d5a7157a07d8e024417b6017')
sha256sums_x86_64=('8381c440fe61fcbb01e209211ac01b519cd6adf51ab1c2281d5daad6ca4c8c8c')

package() {
  install -Ddm755 "$pkgdir/opt"
  mv "$_pkg-$pkgver" "$pkgdir/opt/$_pkg"

  install -Dm755 android-ndk.sh "$pkgdir/etc/profile.d/android-ndk.sh"
}

# vim: ts=2 sw=2 et:
