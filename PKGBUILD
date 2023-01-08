# Maintainer: Raimar Buehmann <raimar _at buemann _dot_ de>

pkgname=lxterminal-gtk2
_pkgname=lxterminal
pkgver=0.4.0
pkgrel=1
pkgdesc="VTE-based terminal emulator for GTK2 (part of LXDE)"
arch=('x86_64')
url="https://lxde.org/"
license=('GPL2')
groups=('lxde' 'lxde-gtk2')
depends=('vte-legacy')
makedepends=('intltool')
conflicts=('lxterminal-gtk3' 'lxterminal' 'lxterminal-git')
source=(https://downloads.sourceforge.net/lxde/$_pkgname-${pkgver}.tar.xz)
sha256sums=('9db8748923b3fa09a82ae2210ed1fa4cdb4c45312009da9caed103d48f8e9be7')

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr --disable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
