# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=dash-static
pkgver=0.5.11.3
pkgrel=1
pkgdesc="POSIX compliant shell that aims to be as small as possible. Statically compiled"
arch=('x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
source=("http://gondor.apana.org.au/~herbert/dash/files/dash-${pkgver}.tar.gz")
sha512sums=('ffe69b8de3586aba298d936168c329524e385252e12979aa1db28761e882048eb5a80673e93a2a2227f61b52fd8b56546b78c5db9c21a022072f536267f8bc20')


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
