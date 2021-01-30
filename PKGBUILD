# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=pacfree
pkgver=0.6.1
pkgrel=1
pkgdesc="A pacman wrapper to make pacman Free and Open Source Software  aware"
arch=(any)
url="https://github.com/leo-arch/pacfree"
license=(GPL2)
depends=('pacman' 'sed')
optdepends=('isfree: Check your Arch system for nonfree software')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('a8901250fe954466c81d357d5db9ee3dd58ab46e956ac22e9ed9f2bf1834cc7e')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -g 0 -o 0 -Dm644 manpage "$pkgdir/usr/share/man/man8/${pkgname}.8"
  gzip "$pkgdir/usr/share/man/man8/${pkgname}.8"
}
