# Maintainer: To Be Assigned <youremail@domain.com>
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
md5sums=('d1e4ed4adedf17cccd328893195bbdba')

build() {
  cd "${pkgname//./-}-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname//./-}-$pkgver"

  make DESTDIR="$pkgdir/" install
}
