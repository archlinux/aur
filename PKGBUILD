# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname="lib32-libhal-storage1-bin"
pkgver=0.5.14_8
pkgrel=1
pkgdesc='Hardware Abstraction Layer by freedesktop.org (libhal-storage.so.1, 32-bit)'
arch=('x86_64')
url='https://www.freedesktop.org/wiki/Software/hal/'
license=('AFL-2.1' 'GPL-2.0')
depends=('glibc')
provides=(
  'libhal-storage'
  'libhal-storage1'
  'libhal-storage.so=1'
)
conflicts=(
  'libhal-storage'
  'libhal-storage1'
)
options=(!buildflags !makeflags !strip !debug)
source=("https://archive.debian.org/debian/pool/main/h/hal/libhal-storage1_${pkgver//_/-}_i386.deb")
sha256sums=('0faf306dd535be0057e0d42dddeadfd08ce4934fe59906684f1d6a3155967954')

package() {
  bsdtar -xvf data.tar.gz -C "$pkgdir"
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
  mv "$pkgdir/usr/share/doc/libhal-storage1" "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/$pkgname/"{copyright,AUTHORS}
}
