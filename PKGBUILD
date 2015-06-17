# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=unsimgcr
pkgver=20110518
pkgrel=1
pkgdesc='Tool to encrypt LPC313x boot images as per boot ROM requirements'
arch=(i686 x86_64)
license=()
url='http://www.lpclinux.com/LPC313x/LPC313xGettingstartedELDK'
source=(ftp://ftp.lpclinux.com/lpc313x/misc/unsimgcr_src.tar)
sha1sums=('c9b3b8f712a09e1820111ea941f8741fa5d82c12')

prepare() {
  cd unsimgcr
  sed 's/-static//' -i makefile
}

build() {
  cd unsimgcr
  make
}

package() {
  cd unsimgcr
  install -Dm755 unsimgcr "$pkgdir"/usr/bin/unsimgcr
}
