# Maintainer: Ors1mer <ors1mer_dev [[at]] proton.me>
pkgname='quadcastrgb'
pkgver=1.0.0
pkgrel=1
pkgdesc="Set RGB mode for the microphone HyperX Quadcast S"
arch=('x86_64')
url="https://gitlab.com/Ors1mer/QuadcastRGB.git"
license=('GPL')
depends=('libusb' 'glibc')
makedepends=('git' 'gettext')
optdepends=('pandoc: generate man from md')
source=(git+$url)
md5sums=('SKIP')

build() {
  cd QuadcastRGB
  make $pkgname
}

package() {
  cd QuadcastRGB
  make install BINDIR_INS="$pkgdir/usr/bin/" \
               MANDIR_INS="$pkgdir/usr/share/man/man1/"
}

