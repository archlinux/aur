# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=dino
pkgver=0.0+433+g76c7dec
_commit=76c7dec75f052cfaf9c3b469ba9d658a71075b6b
pkgrel=1
pkgdesc='Modern XMPP (Jabber) chat client written in GTK+/Vala'
arch=(i686 x86_64)
url=https://dino.im
license=(GPL3)
depends=(glib2 glib-networking gtk3 gpgme libgee libgcrypt qrencode libsoup sqlite)
makedepends=(git cmake gettext ninja vala)
conflicts=(dino-git)
source=(git+https://github.com/dino/dino#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd dino
  git describe --tags | sed 's#-#+#g'
}

build() {
  cd dino
  ./configure --prefix=/usr
  make
}

package() {
  cd dino
  make DESTDIR="$pkgdir" install
}
