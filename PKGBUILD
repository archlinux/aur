# Contributor: 100best

_pkgname=epiphany
pkgname=$_pkgname-unstable
pkgver=3.23.3
pkgrel=2
pkgdesc="A GNOME web browser based on the WebKit rendering engine (unstable version)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Web"
license=('GPL3')
groups=('gnome')
depends=(webkit2gtk gcr gnome-desktop)
makedepends=(intltool itstool docbook-xml startup-notification
             gobject-introspection yelp-tools autoconf-archive 
appstream-glib)
source=(https://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
md5sums=('69f05e28e85da1310f707f6ad865c56f')
provides=("$_pkgname")
conflicts=("$_pkgname")

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/$_pkgname

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
