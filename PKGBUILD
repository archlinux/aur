# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=0.9.3
pkgrel=1
pkgdesc="Tabular data pager designed to be used with psql"
arch=('i686' 'x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('ncurses')
conflicts=('pspg-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('399a9baa4cf92f6ba5248e4a1509dfd4a1ca09132aa439b8d8c0e17396eae94c')

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
