# Maintainer: Raimar Buehmann <raimar _at buemann _dot_ de>

pkgname=lxterminal-gtk2
_pkgname=lxterminal
pkgver=0.3.1
pkgrel=1
pkgdesc="VTE-based terminal emulator for GTK2 (part of LXDE)"
arch=('x86_64')
url="https://lxde.org/"
license=('GPL2')
groups=('lxde' 'lxde-gtk2')
depends=('vte-legacy')
makedepends=('intltool')
conflicts=('lxterminal-gtk3', 'lxterminal')
source=(https://downloads.sourceforge.net/lxde/$_pkgname-${pkgver}.tar.xz)
sha256sums=('cd8df387c2dd40e03b48caacf700820f9421b421954a0ed56395f505411d2c4b')

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr --disable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
