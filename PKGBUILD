# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Felix Yan <$(echo "ZmVsaXhvbm1hcnNAZ21haWwuY29t" | base64 -d)>
# Contributor:  Jan "heftig" Steffens <$(echo "amFuLnN0ZWZmZW5zQGdtYWlsLmNvbQo=" | base64 -d)>


pkgname=libunique3
pkgver=3.0.2
pkgrel=10
pkgdesc='Library for writing single instance applications for GTK3'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Attic/LibUnique'
license=('LGPL')
depends=('gtk3')
makedepends=('gtk-doc' 'gobject-introspection')
makepkgopt=('strip' 'docs' '!libtool' '!staticlibs' 'emptydirs' 'zipman' 'purge' '!upx' '!debug')
provides=('libunique3')
conflicts=('libunique3')
source=(http://ftp.gnome.org/pub/gnome/sources/libunique/${pkgver%.*}/libunique-$pkgver.tar.xz)
sha256sums=('a8f02ce073e2b920cca8ac45d418e7cb64438ad0814780c5912c6d63f8a4e038')

build() {
  cd "$srcdir/libunique-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --disable-dbus
  make
}

package() {
  cd "$srcdir/libunique-$pkgver"
  make DESTDIR="$pkgdir" install
}

