# Maintainer: Thomas Girod <tgirod@altu.fr>
pkgname=overwitch
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="JACK client for Overbridge devices"
arch=('x86_64')
url="https://github.com/dagargo/overwitch"
license=('GPL')
groups=()
depends=('libusb' 'jack' 'libsamplerate' 'libsndfile' 'gettext' 'json-glib' 'gtk3')
makedepends=('make' 'autoconf')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/dagargo/overwitch/releases/download/$pkgver/overwitch-$pkgver.tar.gz")
noextract=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf --install
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

sha256sums=('7b2c7a873640bfa2fbbd5fe76d72d00438615cd474f08a8b5ba990c37d1a2ba0')
