# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=dash-static
pkgver=0.5.10.2
pkgrel=1
pkgdesc="POSIX compliant shell that aims to be as small as possible. Statically compiled"
arch=('x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
source=("http://gondor.apana.org.au/~herbert/dash/files/dash-${pkgver}.tar.gz")
sha512sums=('0ae29be77794df0ba254967649b9728611a75fbb3acd32ab6634d76399d1ce97c7d12d31da465482a7e4f3207093415c496c39525cace9b78ab3cb9444dd7640')


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
