# Maintainer: Sebastian Wilzbach < sebi at wilzbach dot me >
# Contributor: Kai Hildebrandt (derhil) <kai@derhil.de>
# Contributor: Aline Freitas <aline@alinefreitas.com.br>

pkgname=pidgin-hide-chat
pkgver=2.1
pkgrel=1
pkgdesc="Pidgin plugin to show/hide chat windows on connect."
arch=('any')
url="https://github.com/kgraefe/pidgin-hide-chat-on-join/"
license=('GPL')
depends=('pidgin' 'glibc' 'intltool')
makedepends=('pkgconfig')
sha256sums=('bb2f46579984837ce8d504e1bdc8360c2fe3dbccaed40353a2d5761ba3ef7138')

source=("https://github.com/kgraefe/pidgin-hide-chat-on-join/archive/v$pkgver.tar.gz")
build() {
  cd  "$srcdir"/pidgin-hide-chat-on-join-$pkgver
  ./autogen.sh
  ./configure  --prefix=/usr
  make
}

package(){
  cd  "$srcdir"/pidgin-hide-chat-on-join-$pkgver
  make DESTDIR="$pkgdir/" install
}
