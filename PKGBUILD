# Maintainer:  Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: <kfgz at interia dot pl>
# Contributor: <damir at archlinux dot org>

pkgname=ms-sys-devel
pkgver=2.5.3
pkgrel=1
pkgdesc='Used to create Microsoft compatible boot records (devel version)'
arch=('i686' 'x86_64')
url=http://ms-sys.sourceforge.net/
license=('GPL')
conflicts=('ms-sys')
provides=('ms-sys')
source=("http://prdownloads.sourceforge.net/ms-sys/ms-sys-$pkgver.tar.gz")
sha512sums=('18080bef903c68b6032e04124f3b3b9f0eb58517b338c6bd795846d786ee0af6b65760166b591090ad865a08a03346675f3c34ce59c64215059dac1439b558d8')

build() {
  cd ms-sys-$pkgver
  make
}

package() {
  cd ms-sys-$pkgver
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
