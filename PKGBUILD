# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=sludge
pkgver=2.2.1
pkgrel=1
pkgdesc="An engine and development kit for the creation of 2D adventure games."
arch=(i686 x86_64)
url="http://opensludge.sourceforge.net/"
license=('GPL3' 'LGPL')
depends=('glee' 'alure' 'libvpx' 'gtkglext' 'sdl' 'dumb' 'desktop-file-utils')
install="$pkgname.install"
source=("https://github.com/opensludge/opensludge/releases/download/$pkgver/$pkgname-$pkgver-source.tar.gz")
md5sums=('4769a94656411ef3efa486f3d32ac410')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-devkit \
              --enable-doc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
