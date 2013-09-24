# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.10.0
pkgrel=1
pkgdesc="PGP encryption and signing for nautilus"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/seahorse-nautilus/"
license=('GPL')
depends=('libcryptui' 'gcr' 'nautilus')
makedepends=('intltool')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d54c5fbc2bade03296d39999f8412708cfa87e82bda3c5af8e0b8ad86b2fadf3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
