# Maintainer: Stefans Mezulis <stefans.mezulis@gmail.com>
pkgname=pipes.c
pkgver=1.2.1
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
sha256sums=('a9d662280c01de4e7471191b77324674f2e3a736050d4590a2e406573f4f8701')

build() {
  cd "${pkgname//./-}-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname//./-}-$pkgver"

  make DESTDIR="$pkgdir/" install
}
