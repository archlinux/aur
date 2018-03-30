# Maintainer: Stefans Mezulis <stefans.mezulis@gmail.com>
pkgname=pipes.c
pkgver=1.0.0
pkgrel=1
pkgdesc='Small application to mimic the "pipes" screensaver in a terminal window'
arch=('x86_64')
url='https://github.com/pipeseroni/pipes.c'
license=('GPL3')
groups=()
depends=('ncurses')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/pipeseroni/$pkgname/releases/download/v$pkgver/${pkgname//./-}-$pkgver.tar.gz")
noextract=()
sha256sums=('56f0ef7c03472d2a768727fd8cd79acb0acab34ef2e1ec657ec561b5a70b761e')

build() {
  cd "${pkgname//./-}-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname//./-}-$pkgver"

  make DESTDIR="$pkgdir/" install
}
