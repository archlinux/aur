# Maintainer: Erzkanzler <erzkanzler@braincalibration.de>
pkgname=ballerburg
pkgver=1.2.3
pkgrel=2
pkgdesc="Classical castle combat game"
arch=(i686 x86_64)
url="https://baller.frama.io/"
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
source=(https://framagit.org/baller/ballerburg/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz
	ballerburg.appdata.xml
	ballerburg.desktop)
noextract=()
md5sums=('98b3f831bd9b795f6aa7f2c1b57cce08'
	'd4734cd1b9a46f8a6c356588c5bbfac8'
	'f7b972e721655e3da7b69c9c5bc224d4')

build() {
  cd "$pkgname-v$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-v$pkgver"

  make DESTDIR="$pkgdir/" install

  cd ..

  mkdir -p "$pkgdir/usr/share/appdata"
  cp ballerburg.appdata.xml "$pkgdir/usr/share/appdata"
  mkdir -p "$pkgdir/usr/share/applications"
  cp ballerburg.desktop "$pkgdir/usr/share/applications"
}
