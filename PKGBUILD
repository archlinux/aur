# Maintainer: Victor van den Elzen <victor.vde@gmail.com>
pkgname=psisolver-git
pkgver=24d07f7
pkgrel=1
pkgdesc="Exact Inference Engine for Probabilistic Programs"
arch=('i686' 'x86_64')
url="http://psisolver.org/"
license=('custom:Boost Software License 1.0')
makedepends=('git' 'dmd')
aoptdepends=('gnuplot: for --plot')
source=('git+https://github.com/eth-srl/psi')
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver() {
  cd "psi"
  git rev-parse --short HEAD
}

build() {
  cd "psi"
  cp "${startdir}/Makefile" .
  make release
}

package() {
  install -D "${srcdir}/psi/psi" "${pkgdir}/usr/bin/psisolver"
  install -D -m644 "${srcdir}/psi/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
