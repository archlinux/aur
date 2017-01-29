# Maintainer: Martin Mancuska <martin@borg.sk>

_pkgname=qpdfwalker
pkgname=qpdfwalker
pkgver=0.3.0
pkgrel=1
pkgdesc="Tool for browsing hierarchy of low level objects in a PDF file."
arch=('i686' 'x86_64')
url="https://github.com/mato7d5/$_pkgname"
license=('GPL3')
depends=('poppler' 'qt5-base')
makedepends=('git')
source=("git+https://github.com/mato7d5/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
    cd ${srcdir}/${_pkgname}
    git describe --long | sed 's/-.*//'
}

build() {
  cd "$srcdir/$_pkgname"
  git checkout tags/0.3.0
  qmake-qt5 qpdfwalker.pro
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 qpdfwalker "${pkgdir}/usr/local/bin/qpdfwalker"
}
