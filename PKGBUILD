# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=rgbds2
_pkgname=rgbds
pkgver=0.2.5
pkgrel=1
pkgdesc="Rednex GameBoy Development System (0.2.x)"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('custom')
depends=('glibc')
makedepends=('bison')
conflicts=('rgbds')
provides=('rgbds')
source=("https://github.com/rednex/rgbds/releases/download/v$pkgver/rgbds-$pkgver.tar.gz")
sha1sums=('cac03125662ea825248e84a4614da9f8afa8e898')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man7"
  mkdir -p "$pkgdir/usr/share/man/man1"
  make PREFIX="$pkgdir/usr" MANPREFIX="$pkgdir/usr/share/man" install
  install -D LICENSE "$pkgdir/usr/share/licenses/rgbds-git/LICENSE"
}
