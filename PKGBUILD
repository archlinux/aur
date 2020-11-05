# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=xtruss
pkgver=20200918.a94a153
pkgrel=1
pkgdesc="X11 protocol tracer, akin to strace"
arch=(x86_64)
url="https://www.chiark.greenend.org.uk/~sgtatham/xtruss/"
license=(MIT)
source=("https://www.chiark.greenend.org.uk/~sgtatham/xtruss/xtruss-$pkgver.tar.gz")
sha256sums=('623a37f77943a4f2283ab9d76b0e6f0cd19b521643025f85727c8ff75bb46ecc')
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
