# Maintainer: Sebastian Wilzbach < sebi at wilzbach dot me >
# Contributor: Kai Hildebrandt (derhil) <kai@derhil.de>
# Contributor: Aline Freitas <aline@alinefreitas.com.br>

pkgname=pidgin-hide-chat-on-join
pkgver=2.0
pkgrel=1
pkgdesc="Pidgin plugin to show/hide chat windows on connect."
arch=('any')
url="https://github.com/kgraefe/pidgin-hide-chat-on-join/"
license=('GPL')
depends=('pidgin' 'glibc' 'intltool')
makedepends=('pkgconfig')
sha256sums=('6f6be38f03df4e68cdf66cf016fc6f71c7a3d5ef24b416bb7ff7788baeacb303')

source=("https://github.com/kgraefe/pidgin-hide-chat-on-join/archive/v$pkgver.tar.gz")
build() {
  cd  "$srcdir"/$pkgname-$pkgver
  ./autogen.sh
  ./configure  --prefix=/usr
  make
}

package(){
  cd  "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
