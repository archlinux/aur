# Maintainer: Dominic Egginton <dominic.egginton@gmail.com>
pkgname=flip-git
pkgver=0.1.2.r2.ge4df356
pkgrel=1
pkgdesc="Flip coins in your command line"
arch=("x86_64")
url="https://github.com/dominicegginton/flip"
license=('MIT')
provides=(flip)
conflicts=(flip)
source=(${pkgname}"::git+"${url})
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname}
  DESTDIR=${pkgdir} make install
}
