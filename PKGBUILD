# Maintainer: 100best <jm.100best@hotmail.com>

pkgname=epiphany-unstable
pkgver=3.21.90
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine (unstable version)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Web"
license=('GPL')
depends=(libsoup libnotify gsettings-desktop-schemas 'webkit2gtk-unstable>=2.13.1' nss iso-codes
         dconf gcr gnome-desktop libwnck3 gnome-themes-standard)
makedepends=(intltool itstool docbook-xml startup-notification
             gobject-introspection)
source=(http://ftp.gnome.org/pub/GNOME/sources/epiphany/${pkgver:0:4}/epiphany-$pkgver.tar.xz)
md5sums=('1a487a215db94f5f9f055e9fdc972519')
provides=('epiphany')
conflicts=('epiphany')

build() {
  "$srcdir/epiphany-$pkgver/configure" --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
