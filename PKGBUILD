#Maintainer: M0Rf30

pkgname=mtd-tools-git
pkgver=965.0e602bf
pkgrel=1
pkgdesc="MTD userspace tools"
arch=('i686' 'x86_64')
url="http://www.linux-mtd.infradead.org/index.html"
license=('GPL')
depends=('util-linux' 'lzo2')
makedepends=('git')
provides=('mtd-uitls')
replaces=('mtd-utils')
source=("mtd-utils::git://git.infradead.org/mtd-utils.git")

prepare() {
  cd mtd-utils
  sed -i 's/sbin/bin/' common.mk
}

package ()
{
  cd mtd-utils
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd mtd-utils
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
