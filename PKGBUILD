# Maintainer:  Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: <kfgz at interia dot pl>
# Contributor: <damir at archlinux dot org>

pkgname=ms-sys-devel
pkgver=2.7.0
pkgrel=1
pkgdesc='Write Microsoft-compatible boot records (MBR and PBR)'
arch=('x86_64')
url=http://ms-sys.sourceforge.net/
license=('GPL')
conflicts=('ms-sys')
provides=('ms-sys')
source=("https://sourceforge.net/projects/${pkgname%-devel}/files/${pkgname%-devel}-$pkgver.tar.gz")
b2sums=('ae1b6de38bb4ac275f971c7dfbbdc5d32a645ffc0c32a6fa82f6673fa8788f1a328d9609c2e82812fc74b9c94ea980f257297e67b7fb9536c9d42c0fabc26f8f')

build() {
  cd ${pkgname%-devel}-$pkgver

  make
}

package() {
  cd ${pkgname%-devel}-$pkgver

  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
