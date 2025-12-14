# Maintainer: Daniil Gentili <daniil@daniil.it>

_repouser=danog
_reponame=PrimeModule-ext

pkgname=primemodule
pkgdesc="C++ header-only library, binary and FFI library for factorizing huge (up to 2^63-1) numbers (optimized for huge semiprimes)."
pkgver=2.0
pkgrel=1
arch=('any')
license=('GPL')

source=("https://github.com/$_repouser/$_reponame/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('cb09a1e5603abb414f7aafa7be8c78536e036e6a926da48acd6efd75ef0eb25d0a6d16259fe36aca448829eea6bc3341bbb0d5054194e2a0e756f34a8909f1e8')

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  
  make DESTDIR="${pkgdir}/usr" install
}
