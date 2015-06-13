# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ciopfs
pkgver=0.4
pkgrel=2
pkgdesc="Mounts a normal directory in case insensitive fashion"
arch=('i686' 'x86_64')
url="http://www.brain-dump.org/projects/ciopfs/"
license=('GPL2')
depends=('attr' 'glib2' 'fuse')
source=(http://www.brain-dump.org/projects/ciopfs/$pkgname-$pkgver.tar.gz)
md5sums=('1798fc043034f292efd887c05fc4ea1e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  # remove sbin folder, it contains only a symlink anyway
  rm -r $pkgdir/sbin
}

# vim:set ts=2 sw=2 et:
