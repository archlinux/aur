# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.4
pkgrel=2
pkgdesc="Easily send files via mail"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/nautilus-sendto"
license=(GPL)
depends=(glib2)
makedepends=(gettext intltool gobject-introspection python2)
options=('!emptydirs')
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('51065c6e2601560a8bc507c7aee8e967dc6c6f355c6a05a1d4e7e1fe76b908e7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-schemas-compile
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
