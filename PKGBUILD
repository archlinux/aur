# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=1.3.0
pkgrel=1
pkgdesc='Tabular data pager designed to be used with psql'
arch=('i686' 'x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('readline')
conflicts=('pspg-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('82667b6d269ba1a99e2077b5bcb004c50889f1190d491d62c236f22cb90ccae7')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
