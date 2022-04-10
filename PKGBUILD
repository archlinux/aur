# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=vblade
pkgver=25
pkgrel=2
pkgdesc="Virtual EtherDrive(R) blade AoE target"
arch=('i686' 'x86_64')
url="https://github.com/OpenAoE/vblade"
license=('GPL2')
depends=('bash')
source=("git+https://github.com/OpenAoE/vblade.git#tag=vblade-${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/sbin"
  install -d "$pkgdir/usr/share/man/man8"
  make prefix="$pkgdir/usr" install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
