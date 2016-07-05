# Maintainer: buckket <buckket@cock.li>

pkgname=redo-python
_pkgname=redo
pkgver=0.11
pkgrel=2
pkgdesc="Redo implementation in Python."
arch=("any")
license=("GPL")
url="https://github.com/apenwarr/redo"
depends=("python2")
makedepends=("python2-markdown" "python2-beautifulsoup3")
provides=("redo")
conflicts=("redo-c-git" "redo-sh")
source=("https://github.com/apenwarr/redo/archive/redo-${pkgver}.tar.gz" "redo-python.patch")
sha256sums=('2d7743e1389b538e2bd06117779204058fc0fcc0e05fd5ae14791d7f3fc3bcfa'
            '7da13b4a9b02730a0b51243d989497408196374cbeb310dfcd5c2e26f02c6fd1')

prepare() {
  cd "${_pkgname}-${_pkgname}-${pkgver}"
  patch -p1 < ../redo-python.patch 
}

package() {
  cd "${_pkgname}-${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

