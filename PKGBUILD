# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname="libhal-storage1-bin"
pkgver=0.5.14_8
pkgrel=1
pkgdesc='Hardware Abstraction Layer by freedesktop.org (libhal-storage.so.1, 64-bit)'
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
source=("https://archive.debian.org/debian/pool/main/h/hal/libhal-storage1_${pkgver//_/-}_amd64.deb")
sha256sums=('27bc5896865eeff356126ca98f9aaa298d75e6b18d02b57a0cc9504809f9ab44')

package() {
  bsdtar -xvf data.tar.gz -C "$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/libhal-storage1/"{copyright,AUTHORS}
}
