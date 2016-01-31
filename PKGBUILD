# Maintainer: Dmytro Gordiichuk <pr.Moriarty1@gmail.com>
pkgname=fastqsp
pkgver=0.5.1
pkgrel=1
pkgdesc="FastQSP is another interactive fiction player (only for qsp format)"
arch=('i686' 'x86_64')
url="https://github.com/graylor/FastQSP"
license=('GPL3')
depends=('qt5-base')
_origname=FastQSP
source=("https://github.com/graylor/${_origname}/archive/v${pkgver}.tar.gz")
md5sums=('1ef933fe07191b232a8f7b719afbcb17')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"
  qmake-qt5 ${_origname}.pro
  make
}

package() {
  cd "${srcdir}/${_origname}-${pkgver}"
  install -D -m644 "${srcdir}/${_origname}-${pkgver}/qsp/release/libqsp.so" "${pkgdir}/usr/lib/libqsp.so"
  install -D -m755 "${srcdir}/${_origname}-${pkgver}/gui/release/$_origname" "${pkgdir}/usr/bin/$pkgname"
}
