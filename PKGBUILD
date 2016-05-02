# Maintainer: George Hilliard <thirtythreeforty+aur@gmail.com>
pkgname=rabbitsign
pkgver=2.1
pkgrel=3
epoch=
url='http://www.ticalc.org/archives/files/fileinfo/383/38392.html'
pkgdesc="Digitally signs software for Texas Instruments calculators"
arch=('i686' 'x86_64')
license=('GPL3')
groups=()
depends=('gmp')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz" "http://brandonw.net/calcstuff/keys.zip")
noextract=()
md5sums=('dffa5c7da9be215f7501e2aac86ce960'
         '6a5d57da784ea37993b601ce1e93590b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Install keys
  mkdir -p "$pkgdir"/usr/share/rabbitsign
  install -m 644 -t "$pkgdir"/usr/share/rabbitsign/ ../*.key
}

# vim:set ts=2 sw=2 et:
