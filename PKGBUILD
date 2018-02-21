# Maintainer: 3ED_0 <krzysztof1987 at gamil.com>
# Contributor: Roman Kyrylych <roman@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=eiciel
pkgver=0.9.12.1
pkgrel=1
pkgdesc="GNOME file ACL editor"
arch=('i686' 'x86_64')
url="http://rofi.roger-ferrer.org/eiciel/"
license=('GPL')
depends=('acl' 'gtkmm3' 'nautilus' 'desktop-file-utils' 'gnome-vfs')
options=('!libtool')
source=(http://rofi.roger-ferrer.org/eiciel/files/${pkgname}-${pkgver}.tar.bz2)
#source=(https://launchpad.net/ubuntu/+archive/primary/+files/eiciel_0.9.8.1.orig.tar.bz2)
sha512sums=('f54fbb149eed7f8fd534b77ec5e2d0f579c68a39afd7417a2298d75c7e95c459b49fc8ccb66d0188956ffaadf3bcc8a3eb048425cb82fc875573eb131f4b0494')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS="-std=c++11"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
