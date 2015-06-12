# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bookshelf
pkgver=1
pkgrel=1
pkgdesc='Virtual bookshelf browser for the terminal'
arch=(any)
url='https://github.com/maandree/bookshelf'
license=(GPL3)
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

