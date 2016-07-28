# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.11.92
pkgrel=2
pkgdesc="PGP encryption and signing for nautilus"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/seahorse-nautilus/"
license=('GPL')
depends=('libcryptui' 'gcr' 'nautilus')
makedepends=('intltool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('70374f9bb46a0adfbd154f4094e7a05b7766abfe60845a0a49463b4d15f17f92')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile --disable-gpg-check
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
