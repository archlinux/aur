# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=dash-static
pkgver=0.5.12
pkgrel=1
pkgdesc="POSIX compliant shell that aims to be as small as possible. Statically compiled"
arch=('x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
source=("http://gondor.apana.org.au/~herbert/dash/files/dash-${pkgver}.tar.gz")
sha512sums=('13bd262be0089260cbd13530a9cf34690c0abeb2f1920eb5e61be7951b716f9f335b86279d425dbfae56cbd49231a8fdffdff70601a5177da3d543be6fc5eb17')


build () {
  cd "dash-$pkgver"
  export CC="gcc -static"
  export CFLAGS="-Os -static"
  ./configure --with-libedit
  make
}

package() {
  cd "dash-$pkgver"
  install -Dm755 src/dash $pkgdir/usr/bin/dash-static
}
