# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=xtruss
pkgver=20181001.82973f5
pkgrel=1
pkgdesc="X11 protocol tracer, akin to strace"
arch=(x86_64)
url="https://www.chiark.greenend.org.uk/~sgtatham/xtruss/"
license=(MIT)
source=("https://www.chiark.greenend.org.uk/~sgtatham/xtruss/xtruss-$pkgver.tar.gz")
sha256sums=('edb9589654516544dc055442aa686a7688b332c9c2511ece94280cf6459aa8d6')
depends=()

build() {
  cd xtruss-$pkgver
  ./configure --prefix=/usr
  make xtruss
}

package() {
  cd xtruss-$pkgver
  DESTDIR="$pkgdir" make install
}
