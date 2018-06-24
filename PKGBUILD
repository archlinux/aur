# Maintainer: Stefans Mezulis <stefans.mezulis@gmail.com>
pkgname=pipes.c
pkgver=1.2.0
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
sha256sums=('b5d7a2bf41089ac86a63011ed9c7c2a178ebfd65651f83d333e7dc6107a85ec6')

build() {
  cd "${pkgname//./-}-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname//./-}-$pkgver"

  make DESTDIR="$pkgdir/" install
}
