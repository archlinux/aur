# Maintainer: Your Name <ryexander@gmail.com>
pkgname=silan
pkgrel=1
pkgver=v0.3.2
pkgdesc="A standalone application to analyze audio files for silence and
print ranges of detected signals."
arch=('i686' 'x86_64')
url="https://github.com/x42/silan"
license=('GPL2')
depends=('libsndfile' 'ffmpeg')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("${pkgname}.tar.gz::https://github.com/x42/silan/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('2eb87b44732d2dcf6cc3e26b2105946b')

prepare() {
  cd "$srcdir/${pkgname}"
}

build() {
	cd "$srcdir/${pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
