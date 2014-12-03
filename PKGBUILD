# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=photomolo
pkgver=1.2.4
pkgrel=1
pkgdesc="Frontend to manage connections to remote filesystems using GIO/GVFS"
arch=('i686' 'x86_64')
url="http://www.nic.funet.fi/pub/sci/graphics/packages/photomolo/photomolo.html"
license=('GPL2')
depends=('libjpeg-turbo')
source=(http://www.nic.funet.fi/pub/sci/graphics/packages/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8e277b95023b2e32171edeae5367e7f5')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make PREFIX="${pkgdir}"/usr install installman

  install -d "${pkgdir}"/usr/share/doc/$pkgname
  cp -r examples "${pkgdir}"/usr/share/doc/$pkgname
  chmod -x "${pkgdir}"/usr/share/doc/$pkgname/examples/*
}
