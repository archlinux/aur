# Maintainer: Tharre <tharre3@gmail.com>
# Contributor: Damien Flament <damien.flament at gmx dot com>

pkgname=brittany
pkgver=0.11.0.0.x2
pkgrel=1
pkgdesc="An Haskell source code formatter."
arch=('i686' 'x86_64')
url="https://github.com/lspitzner/${pkgname}"
license=('AGPL3')
makedepends=('stack')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7815237fdb847ba71c956e6838387d1d9de14db8a021ce29af39475a8255aeb1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  stack build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  stack install --local-bin-path "${pkgdir}/usr/bin"
}
