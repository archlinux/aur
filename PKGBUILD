# Maintainer: Nima Askarian <nimaas1400@gmail.com>
pkgname=potato-c
pkgver=v0.1
pkgrel=1
_gitname=potato-c
pkgdesc="A featureful, modular and lightweight pomodoro timer."
keywords=""

provides=(potctl potd potui)
makedepends=(git make)
arch=('x86_64')
license=('GPL3')
optdepends=('libnotify: sending notifications on event support')

source=(
  "${pkgname}.tar.gz::https://github.com/nimaaskarian/potato-c/archive/refs/tags/${pkgver}.zip"
)

md5sums=('449f78f70c4acaf05b94839bd96c8a58')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
