# Maintainer: Charlie Sale <softwaresale01@gmail.com>
pkgname=libsocketpp
pkgver=1.0
pkgrel=1
pkgdesc="A modern C++ library for sockets"
arch=(x86_64)
url="https://github.com/softwaresale/libsocketpp"
license=('GPL')
groups=()
depends=(gcc autoconf automake libtool)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/softwaresale/libsocketpp/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('b12580699a8432ba51f67894766d6d6212dd32d5eae296ff6bf51cd40862ff00') 
#autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
