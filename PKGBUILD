# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: <kfgz at interia dot pl>
# Contributor: <damir at archlinux dot org>

pkgname=ms-sys
pkgver=2.4.1
pkgrel=1
epoch=1
pkgdesc='Used to create Microsoft compatible boot records'
arch=('i686' 'x86_64')
url=http://ms-sys.sourceforge.net/
license=('GPL')
makedepends=('hardening-wrapper')
source=("http://prdownloads.sourceforge.net/ms-sys/ms-sys-$pkgver.tar.gz")
sha512sums=('28b8c58432c579a79d17ce458fe94351d8df211fe4f7b355281fb2146580b49e51a8ae335227b962db24489e66b1ceaa9ca7e40ad72ec5198f24bdf7bb2e3be4')

build() {
  cd ms-sys-$pkgver
  make
}

package() {
  cd ms-sys-$pkgver
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
