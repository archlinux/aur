# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=vinagre
pkgver=3.20.2
pkgrel=1
pkgdesc="A VNC Client for the GNOME desktop"
url="https://wiki.gnome.org/Apps/Vinagre"
arch=(i686 x86_64)
license=(GPL)
depends=(libsecret gtk-vnc vte3 telepathy-glib avahi dconf spice-gtk3 gnutls freerdp)
optdepends=('openssh: SSH plugin')
makedepends=(docbook-xsl intltool openssh itstool spice-protocol)
groups=(gnome-extra)
options=(!emptydirs)
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('5fc78ef9ab9ee7d4e3c50d38d82d9bcbd915191bcf0349d55a2fd56eaa87eaa0')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/$pkgname \
    --enable-rdp --enable-spice --enable-compile-warnings=minimum
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
