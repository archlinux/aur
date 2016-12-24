# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# It is technically possible to build everything in this package from source but that requries a whole android tree which is about 30GB.

pkgname=ubuntu-emulator-runtime-bin
pkgver=20160330.0939
pkgrel=1
pkgdesc="Ubuntu Touch emulator runtime"
arch=('i686' 'x86_64')
url="https://launchpad.net/goget-ubuntu-touch"
license=("custom")
provides=("ubuntu-emulator-runtime")
conflicts=("ubuntu-emulator-runtime")
source=("http://mirrors.kernel.org/ubuntu/pool/multiverse/a/android/ubuntu-emulator-runtime_${pkgver/./-}-0ubuntu1_i386.deb")
sha512sums=('5c5346ccd88fd063e0e47772410fa88bd81b6c875e7651cfede00f9b8de5f6b0a60cffb30a7b5252f6155243034dbb8b0f96a42497b1c0ac39ed5eee11de5cbb')

package() {
  bsdtar xf data.tar.xz
  chmod -R g-w usr
  mv usr $pkgdir

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  mv $pkgdir/usr/share/doc/ubuntu-emulator-runtime/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
