# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=pacfree
pkgver=0.6.2
pkgrel=1
pkgdesc="A pacman wrapper to make pacman free-software aware"
arch=(any)
url="https://github.com/leo-arch/pacfree"
license=(GPL2)
depends=('pacman' 'sed' 'util-linux' 'gawk')
optdepends=('isfree: Check your Arch system for nonfree software')
makedepends=('git')
#source=("git+${url}.git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/pacfree/archive/v${pkgver}.tar.gz")
sha256sums=('eb0332cbaa352d3db301851d8624e96a076dce2a11bd3c24a01d1de470b0217e')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -g 0 -o 0 -Dm644 manpage "$pkgdir/usr/share/man/man8/${pkgname}.8"
  gzip "$pkgdir/usr/share/man/man8/${pkgname}.8"
}
