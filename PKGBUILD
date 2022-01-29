# Maintainer: Daniil Gentili <daniil@daniil.it>

_repouser=danog
_reponame=PrimeModule-ext

pkgname=primemodule
pkgdesc="C++ header-only library, binary and FFI library for factorizing huge (up to 2^63-1) numbers (optimized for huge semiprimes)."
pkgver=1.0.0
pkgrel=1
arch=('any')
license=('GPL')
url="https://github.com/danog/PrimeModule-ext"

source=("https://github.com/$_repouser/$_reponame/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('69f1961c5d25ce4fa2074544951e55ad7585a0c36e03fe880e15926c794cd4942bdd5253cc39421b278af24b962a7f9f4813cb454ebfde4d5cd5f9c3e7770860')

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  
  make DESTDIR="${pkgdir}/usr" install
}
