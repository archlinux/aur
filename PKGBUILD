# Maintainer: 100best <jm.100best@hotmail.com>

_pkgname=epiphany
pkgname=$_pkgname-unstable
pkgver=3.23.1.2
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine (unstable version)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Web"
license=('GPL3')
groups=('gnome')
depends=(libhttpseverywhere libsoup libnotify webkit2gtk nss iso-codes
         dconf gcr gnome-desktop libwnck3 gnome-themes-standard)
makedepends=(intltool itstool docbook-xml startup-notification
             gobject-introspection)
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
md5sums=('4579058e42f0d1cce64f0e9c7b1ec81c')
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
