# Maintainer: 100best <jm.100best@hotmail.com>

_pkgname=epiphany
pkgname=epiphany-unstable
pkgver=3.22.0
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine (unstable version)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Web"
license=('GPL')
groups=('gnome')
depends=(libsoup libnotify gsettings-desktop-schemas webkit2gtk nss iso-codes
         dconf gcr gnome-desktop libwnck3 gnome-themes-standard)
makedepends=(intltool itstool docbook-xml startup-notification
             gobject-introspection)
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
md5sums=('8cc2aaca0d4571d8a09f0d7d86fe6517')
replaces=("$_pkgname")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

build() {
  "$srcdir/$_pkgname-$pkgver/configure" --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/$_pkgname
  make
}

package() {
  make DESTDIR="$pkgdir" install
}
