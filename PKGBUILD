# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=1.0.0
pkgrel=1
pkgdesc='Tabular data pager designed to be used with psql'
arch=('i686' 'x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('ncurses')
conflicts=('pspg-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1035015f8fb29c749d5c1d023db0c391c79c2fa7180cfecdf788dd7e9c9a0fbc')

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
