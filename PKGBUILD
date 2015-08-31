# Maintainer: 3ED_0 <krzysztof1987 at gamil.com>
# Contributor: Roman Kyrylych <roman@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=eiciel
pkgver=0.9.10
pkgrel=1
pkgdesc="GNOME file ACL editor"
arch=('i686' 'x86_64')
url="http://rofi.roger-ferrer.org/eiciel/"
license=('GPL')
depends=('acl' 'gtkmm3' 'nautilus' 'desktop-file-utils' 'gnome-vfs')
options=('!libtool')
install=eiciel.install
source=(http://rofi.roger-ferrer.org/eiciel/download/${pkgname}-${pkgver}.tar.bz2)
#source=(https://launchpad.net/ubuntu/+archive/primary/+files/eiciel_0.9.8.1.orig.tar.bz2)
sha512sums=('7801753edfb07b566f4979067c91031dcb8f3010a7cc96e12b05847706d81e10eb6c5e6df224c98cf9d2ad8cb5d9b7848dd610e1c6c3c8a2331c1d4ca3cc61fe')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
