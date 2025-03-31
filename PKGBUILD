# Maintainer: Raimar Buehmann <raimar _at buemann _dot_ de>

pkgname=lxterminal-gtk2
_pkgname=lxterminal
pkgver=0.4.1
pkgrel=1
pkgdesc="VTE-based terminal emulator for GTK2 (part of LXDE)"
arch=('x86_64')
url="https://lxde.org/"
license=('GPL2')
groups=('lxde' 'lxde-gtk2')
depends=('vte3')
makedepends=('intltool')
conflicts=('lxterminal-gtk3' 'lxterminal' 'lxterminal-git')
source=(
	https://github.com/lxde/lxterminal/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=('d5da0646e20ad2be44ef69a9d620be5f1ec43b156dc585ebe203dd7b05c31d88')

build() {
  cd $_pkgname-$pkgver
  ./autogen.sh
  ./configure --sysconfdir=/etc --prefix=/usr --disable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
