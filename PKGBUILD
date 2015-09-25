# Maintainer: goetzc
# Contributor: Neven Sajko

pkgname=freefall
pkgver=3.d74aae4e
pkgrel=3
pkgdesc='Disk protection for HP/DELL machines.'
arch=(i686 x86_64)
url=https://github.com/torvalds/linux/tree/master/tools/laptop/freefall
license=(GPL2)
depends=(glibc)
replaces=(hpfall hpfall-git)
source=(https://raw.githubusercontent.com/torvalds/linux/v4.2/tools/laptop/freefall/freefall.c
        freefall@.service)
sha256sums=('6fad3e93be9fdb5fbf87ced466961d0c3190614bf5e8efdb0fa20071f4dc06ba'
            'bed4b24d02dec15fa2352472fc372f43d5d0ecd499c6d27333b806d6cc2b031a')

build() {
  gcc $CFLAGS $CPPFLAGS -o freefall freefall.c
}

package() {
  install -Dm755 freefall "$pkgdir/usr/bin/freefall"
  install -Dm644 freefall@.service "$pkgdir/usr/lib/systemd/system/freefall@.service"
}
