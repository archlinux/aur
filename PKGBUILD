# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.10.1
pkgrel=1
pkgdesc="PGP encryption and signing for nautilus"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/seahorse-nautilus/"
license=('GPL')
depends=('libcryptui' 'gcr' 'nautilus')
makedepends=('intltool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('eacaf33bba920cf117641393a6eef483dbc075009349082e77d22f79afbd823a')

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
