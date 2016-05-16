# Maintainer: Patrick Burroughs (Celti) <celti@celti.name<

pkgname=networkmanager-libreswan
pkgver=1.2.0
pkgrel=1
pkgdesc="NetworkManager IPSec VPN plugin for Libreswan"
arch=('i686' 'x86_64')
license=('GPL')
url='http://wiki.gnome.org/Projects/NetworkManager/VPN'
depends=('libnm-gtk' 'libsecret' 'libreswan' 'libnl')
makedepends=('intltool' 'python')
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-libreswan/${pkgver::3}/NetworkManager-libreswan-${pkgver}.tar.xz)
sha256sums=('fd9275f784e285557eb963e768333f96da2dec1935bfaf3d10998f2ee8c700d3')

build() {
  cd NetworkManager-libreswan-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/networkmanager \
    --enable-more-warnings=yes \
    --disable-static
  make
}

package() {
  cd NetworkManager-libreswan-$pkgver
  make DESTDIR="$pkgdir" install
}
