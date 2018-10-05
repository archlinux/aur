# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=findent
pkgver=2.8.6
pkgrel=1
pkgdesc="Indents and beautifies Fortran source."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/findent/"
license=('custom:BSD')
depends=('bash')
source=("https://datapacket.dl.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('199440c938c64c219cc3296c285e1f5051608254b9977721d965559e56211b3b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENCE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENCE
}
