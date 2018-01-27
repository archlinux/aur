# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=0.9.2
pkgrel=1
pkgdesc="Tabular data pager designed to be used with psql"
arch=('i686' 'x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('ncurses')
conflicts=('pspg-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c1953f5ea08acc26e6509bee46aee0e19132f7ccde27bc8fd5d5b1a70fbabf87')

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
