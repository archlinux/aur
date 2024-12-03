# Maintainer: JustKidding <jk@vin.ovh>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aectann <aectann@infoline.su>

pkgname=fbv
pkgver=1.0b
pkgrel=13
pkgdesc="FrameBuffer image viewer"
arch=('x86_64')
url="https://github.com/jstkdng/fbv"
license=('GPL')
depends=('libpng' 'libjpeg')
source=("git+https://github.com/jstkdng/fbv.git")
sha256sums=('SKIP')

build() {
  cd fbv
  ./configure --prefix="$pkgdir/usr" --mandir="$pkgdir/usr/share/man"
  make
}

package() {
  cd fbv
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  make install
}
