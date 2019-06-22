# Maintainer:  Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: <kfgz at interia dot pl>
# Contributor: <damir at archlinux dot org>

pkgname=ms-sys-devel
pkgver=2.6.0
pkgrel=1
pkgdesc='Write Microsoft-compatible boot records (MBR and PBR)'
arch=('x86_64')
url=http://ms-sys.sourceforge.net/
license=('GPL')
conflicts=('ms-sys')
provides=('ms-sys')
source=("https://sourceforge.net/projects/${pkgname%-devel}/files/${pkgname%-devel}-$pkgver.tar.gz")
sha512sums=('f49790813712b9fd9f63273a7571edbdacb855d93d26dfe1da94d35b656c0ec0574ec43b3cad0f363fa4ec18bd29b81a440d592dc8148b15b18bb8a28c35fbbe')

build() {
  cd ${pkgname%-devel}-$pkgver

  make
}

package() {
  cd ${pkgname%-devel}-$pkgver

  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
