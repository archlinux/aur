# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=nspluginwrapper
pkgver=1.4.0
pkgrel=3
pkgdesc="Cross-platform NPAPI compatible plugin viewer"
arch=('x86_64')
url="http://nspluginwrapper.davidben.net/"
license=('GPL')
depends=('curl' 'lib32-libxt' 'lib32-gcc-libs' 'gtk2' 'lib32-gtk2')
makedepends=('gcc-multilib')
install="install"
source=(http://web.mit.edu/davidben/Public/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('39b9034dc840ac6a21701406d96449e578b787aad7f6a09d97113776cf8251b3')
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
