# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Gabriel <kainlite@gmail.com>
pkgname=libflate
pkgver=2.0.1
pkgrel=1
pkgdesc="Flate is a C template library used to deal with html code in CGI applications."
arch=('i686' 'x86_64')
url="http://flate.dead-inside.org/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://flate.dead-inside.org/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('840723fc6ab683f0cc87053890d41363') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

	sudo install -Dm644 "$srcdir/$pkgname-$pkgver/flate.o" "/usr/lib/"
	sudo install -Dm644 "$srcdir/$pkgname-$pkgver/libflate.a" "/usr/lib/"
}
