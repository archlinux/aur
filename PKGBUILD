# Maintainer: Iohan THERY <iohan.thery@orange.fr>
pkgname=belooted
pkgver=0.1.4.1
pkgrel=1
pkgdesc="Belote, a fun GTK card game playing against computer"
arch=('i686' 'x86_64')
url="http://boby.joe.free.fr/dev/belooted/files/"
license=('GPL')
groups=()
depends=('gtk2')
makedepends=('gnome-common' 'intltool')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://boby.joe.free.fr/dev/belooted/files/belooted-0.1.4.1.tar.gz)
noextract=()
md5sums=('311e1f7a6c5b92232f591092d08b9425')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|LIBS =|LIBS = -lm |" src/Makefile.am
  gnome-autogen.sh
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

