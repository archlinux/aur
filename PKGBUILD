# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=1.6.0
pkgrel=1
pkgdesc='Tabular data pager designed to be used with psql'
arch=('i686' 'x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('readline')
conflicts=('pspg-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d1ede593266990860c026bd586b3a3447efeb9e78010cbc0b2cb3951b76edae3')

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
