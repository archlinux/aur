# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>
# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=hidattack
pkgver=0.1
pkgrel=1
pkgdesc="HID Attack (attacking HID host implementations)"
url='http://mulliner.org/bluetooth/hidattack.php'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('bluez' 'openobex')
source=(http://www.mulliner.org/bluetooth/hidattack${pkgver//./}.tar.gz)
sha512sums=('78865a5cdd3c38f0df6246003f219d6183c1b8e2279055ff3e972ae4b74359bdc096a4837615882f123e679750d23456848eedac119f4c51dbf9c01a54bdc2d4')

build() {
  cd "$srcdir/hidattack${pkgver//./}"
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir/hidattack${pkgver//./}"
  install -Dm755 hidattack $pkgdir/usr/bin/hidattack
  install -Dm644 README $pkgdir/usr/share/hidattack/README
  install -Dm644 ha.inp $pkgdir/usr/share/hidattack/ha.inp
}

