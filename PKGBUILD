# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=bookshelf
pkgver=1
pkgrel=2
pkgdesc='Virtual bookshelf browser for the terminal'
arch=(any)
url='https://github.com/maandree/bookshelf'
license=(GPL-3.0)
depends=(bash grep coreutils)
optdepends=('jfbview: default document viewer under TTY'
            'xpdf: default document viewer under X')
makedepends=(texinfo gzip)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(cfa0a9f1482533ccc0be068abd9deab716d966b837668dfdca0beba10dfa9493)


build() {
  cd "${srcdir}/bookshelf-${pkgver}"
  make
}

package() {
  cd "${srcdir}/bookshelf-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

