# Maintainer: robertfoster

pkgname=nnls-chroma
pkgver=1.1
pkgrel=2
pkgdesc="NNLS Chroma/Chordino is an open source Vamp plugin library for harmony and chord extraction."
arch=(i686 x86_64)
url="https://soundsoftware.ac.uk"
license=('GPL')
groups=('pro-audio' 'vamp-plugins')
depends=('vamp-plugin-sdk')
makedepends=('boost')
_nnls_commit=82d5d11b68d7
source=("${pkgname}-${pkgver}.tar.gz::https://code.soundsoftware.ac.uk/hg/nnls-chroma/archive/${_nnls_commit}.tar.gz")

build() {
  cd "${pkgname}-${_nnls_commit}"
  make -f Makefile.linux
}

package() {
  cd "${pkgname}-${_nnls_commit}"
  install -vDm 644 nnls-chroma.cat \
    -t "${pkgdir}/usr/lib/vamp/"
  install -vDm 644 nnls-chroma.n3 \
    -t "${pkgdir}/usr/lib/vamp/"
  install -vDm 755 nnls-chroma.so \
    -t "${pkgdir}/usr/lib/vamp/"
}

sha256sums=('93e53501981b829c85ef1a4edbac68095a5afdb2670f83fba1618e9004fdf503')
