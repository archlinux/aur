# Maintainer: JustKidding <jk@vin.ovh>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aectann <aectann@infoline.su>

pkgname=fbv
pkgver=1.0c
pkgrel=1
pkgdesc="FrameBuffer image viewer"
arch=("x86_64")
url="https://github.com/jstkdng/fbv"
license=("GPL-2.0-only")
depends=("libpng" "libjpeg")
source=("https://github.com/jstkdng/fbv/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b9884211d499682aa9d149dd4829dbe835f5b0166a73fbe95f58b935b102fcf4')

build() {
  cd "fbv-${pkgver}"
  ./configure --prefix="$pkgdir/usr" --mandir="$pkgdir/usr/share/man"
  make
}

package() {
  cd "fbv-${pkgver}"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  make install
}
