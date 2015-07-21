# Maintainer: 3ED_0 <krzysztof1987 at gamil.com>
# Contributor: Roman Kyrylych <roman@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=eiciel
pkgver=0.9.9
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
sha512sums=('d2031cdc479851ce207000251dcef9121501f8447b60d37fad9f0fe940bfde0e775443f6988f058e565920089cfacf007461f3c8b5a4146f779f9a22396ac7e9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
