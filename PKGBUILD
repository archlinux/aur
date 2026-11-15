# Maintainer: Finn Künstner <finn dot kuenstner at gmail dot com>

pkgname=kwin-type
pkgver=0.2
pkgrel=1
pkgdesc="Autotype text from stdin on KDE's KWin Wayland compositor"
arch=('x86_64')
url='https://git.zx2c4.com/kwin-type'
license=('GPL-2.0-only')
depends=('dbus' 'glibc' 'kwin' 'libei')
makedepends=('git')
source=("git+$url#tag=v$pkgver?signed")
sha256sums=('57cc4ae2d4ef6ad741d6089a2afcdf941cbc91abb61f4df9b521afa850fe8e21')
validpgpkeys=('AB9942E6D4A4CFC3412620A749FC7012A5DE03AE')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
