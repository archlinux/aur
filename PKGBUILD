# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname="libhal1-bin"
pkgver=0.5.14_8
pkgrel=2
pkgdesc='Hardware Abstraction Layer by freedesktop.org (libhal.so.1, 64-bit)'
arch=('x86_64')
url='https://www.freedesktop.org/wiki/Software/hal/'
license=('AFL-2.1' 'GPL-2.0')
depends=('glibc')
provides=(
  'libhal'
  'libhal1'
  'libhal.so=1'
)
conflicts=(
  'libhal'
  'libhal1'
  'hal-flash'
)
options=(!buildflags !makeflags !strip !debug)
source=("https://archive.debian.org/debian/pool/main/h/hal/libhal1_${pkgver//_/-}_amd64.deb")
sha256sums=('709ca106331f974ac0f01d3d5fd97cd594dd2db700f57f395711b807f470f61c')

package() {
  bsdtar -xvf data.tar.gz -C "$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/doc/libhal1/"{copyright,AUTHORS}
}
