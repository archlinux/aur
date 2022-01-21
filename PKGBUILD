# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Fredrik Strandin <fredrik@strandin.name>

pkgname=libminizinc
pkgver=2.5.5
pkgrel=1
pkgdesc="A modelling language for constraint programming problems"
arch=(i686 x86_64)
url="https://www.minizinc.org/"
makedepends=(cmake)
depends=(gcc-libs)
license=('MPL2')
conflicts=(minizinc-bin)
provides=(minizinc)
source=("$pkgname-$pkgver.tar.gz::https://github.com/MiniZinc/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c6c81fa8bdc2d7f8c8d851e5a4b936109f5d996abd8c6f809539f753581c6288')

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=$pkgdir install

  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
