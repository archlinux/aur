# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=networkmanager-openswan
_pkgname=NetworkManager-openswan
pkgver=0.9.8.0
pkgrel=1
pkgdesc="NetworkManager plugin for IPSec VPN tunnels"
arch=('i686' 'x86_64')
url="http://ftp.acc.umu.se/pub/GNOME/sources/NetworkManager-openswan/"
license=('GPL')
depends=('openswan' 'gtk3' 'networkmanager' 'libgnome-keyring')
makedepends=('intltool')
source=(http://ftp.acc.umu.se/pub/GNOME/sources/$_pkgname/0.9/$_pkgname-$pkgver.tar.xz)
md5sums=('6a373868f85ac3b7c953f7fd6c76e637')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/networkmanager
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
