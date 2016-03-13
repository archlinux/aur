# Maintainer: 3ED_0 <krzysztof1987 at gamil.com>
# Contributor: Roman Kyrylych <roman@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=eiciel
pkgver=0.9.11
pkgrel=1
pkgdesc="GNOME file ACL editor"
arch=('i686' 'x86_64')
url="http://rofi.roger-ferrer.org/eiciel/"
license=('GPL')
depends=('acl' 'gtkmm3' 'nautilus' 'desktop-file-utils' 'gnome-vfs')
options=('!libtool')
install=eiciel.install
source=(http://rofi.roger-ferrer.org/eiciel/files/${pkgname}-${pkgver}.tar.bz2)
#source=(https://launchpad.net/ubuntu/+archive/primary/+files/eiciel_0.9.8.1.orig.tar.bz2)
sha512sums=('914b8b888e502a31f6c70bcc7d391ea8b79dde07e13b9a6ebb3b52a20b793fafd7a7a7f8ff7177c0150a223a74cae1b06fca0a274bc27545bb89223b4b8fd2aa')

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
