# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=vblade
pkgver=22
pkgrel=2
pkgdesc="Virtual EtherDrive(R) blade AoE target"
arch=('i686' 'x86_64')
url="http://aoetools.sourceforge.net/"
license=('GPL2')
depends=('bash')
source=("http://downloads.sourceforge.net/aoetools/$pkgname-$pkgver.tar.gz")
md5sums=('510d98ba0f231284a5fbe2da11cb2d6e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/sbin"
  install -d "$pkgdir/usr/share/man/man8"
  make prefix="$pkgdir/usr" install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
