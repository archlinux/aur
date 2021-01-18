# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=pacfree
pkgver=0.6.0
pkgrel=3
pkgdesc="A pacman wrapper to make pacman Free and Open Source Software  aware"
arch=(any)
url="https://github.com/leo-arch/pacfree"
license=(GPL2)
depends=('pacman' 'sed')
optdepends=('isfree: Check your Arch system for nonfree software')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/pacfree/archive/v${pkgver}.tar.gz")
sha256sums=('3d058e868dc7197a4584bc520f5f76ba3b29fec776bccbe21b5411a6c4661153')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -g 0 -o 0 -Dm644 manpage "$pkgdir/usr/share/man/man8/${pkgname}.8"
  gzip "$pkgdir/usr/share/man/man8/${pkgname}.8"
}
