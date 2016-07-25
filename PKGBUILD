# Maintainer: Martin Mancuska <martin@borg.sk>

_pkgname=qpdfwalker
pkgname=qpdfwalker-git
pkgver=dev1
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
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  qmake-qt5 qpdfwalker.pro
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 qpdfwalker "${pkgdir}/usr/local/bin/qpdfwalker"
}
