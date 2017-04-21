# Maintainer: Thomas Baag <aur@spam.b2ag.de>
pkgname=ballerburg
pkgver=1.2.0
pkgrel=2
pkgdesc="Classical castle combat game"
arch=(i686 x86_64)
url="http://baller.tuxfamily.org/"
license=('GPL3')
groups=()
depends=('sdl')
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://download.tuxfamily.org/baller/$pkgname-$pkgver.tar.gz
	ballerburg.appdata.xml
	ballerburg.desktop)
noextract=()
md5sums=('ad8beb770dfa151a8c171a6beecf5a44'
	'd4734cd1b9a46f8a6c356588c5bbfac8'
	'f7b972e721655e3da7b69c9c5bc224d4')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  cd ..

  mkdir -p "$pkgdir/usr/share/appdata"
  cp ballerburg.appdata.xml "$pkgdir/usr/share/appdata"
  mkdir -p "$pkgdir/usr/share/applications"
  cp ballerburg.desktop "$pkgdir/usr/share/applications"
}
