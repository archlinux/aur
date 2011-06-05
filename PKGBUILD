# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=nspluginwrapper
pkgver=1.4.2
pkgrel=1
pkgdesc="Cross-platform NPAPI compatible plugin viewer"
arch=('x86_64')
url="http://nspluginwrapper.davidben.net/"
license=('GPL')
depends=('curl' 'lib32-libxt' 'lib32-gcc-libs' 'gtk2' 'lib32-gtk2')
makedepends=('gcc-multilib')
install="install"
source=(http://nspluginwrapper.davidben.net/download/$pkgname-$pkgver.tar.gz)
md5sums=('2f87c5af9aafe99e474aac548bc40705')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --with-lib32=lib32 --with-lib64=lib
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
