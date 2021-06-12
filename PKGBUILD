# Maintainer: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=findent
pkgver=3.1.7
pkgrel=1
pkgdesc="Indent, beautify Fortran source, generate dependencies"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/findent/"
license=('BSD')
depends=('bash')
source=("https://master.dl.sourceforge.net/project/findent/findent-3.1.7.tar.gz")
sha256sums=('42bbf3fd80c14bb44fd18fa73aa53596829f4fb2bacabe57733eb8a9e4f00bb2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENCE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENCE
}
