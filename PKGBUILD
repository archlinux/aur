# Contributors:
#   sh0 <mee@sh0.org>
#   s1gma <s1gma@mindslicer.com>
#   henning mueller <henning@orgizm.net>
#
# Find this package in the AUR:
#   https://aur.archlinux.org/packages/paxctl
#
# Please report bugs and feature requests on GitHub:
#   https://github.com/nning/paxctl
#

pkgname=paxctl
pkgver=0.9
pkgrel=1
pkgdesc='Manages various PaX related program header flags for Elf32, Elf64, binaries'
url=http://pax.grsecurity.net
arch=(i686 x86_64)
license=(GPL)
depends=()
source=(http://pax.grsecurity.net/$pkgname-$pkgver.tar.gz)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's:/sbin:/usr/bin:' Makefile
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('a330ddd812688169802a3ba29e5e3b19956376b8f6f73b8d7e9586eb04423c2e')
