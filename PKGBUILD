# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=selectdefaultapplication-git
pkgver=r9.23da033
pkgrel=1
pkgdesc='A very simple application that lets you define default applications on Linux in a sane way'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/selectdefaultapplication'
license=('GPL')
depends=('qt5-base')
makedepends=('git')
source=("git://github.com/sandsmark/selectdefaultapplication.git")
md5sums=('SKIP')

pkgver() {
  cd selectdefaultapplication
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd selectdefaultapplication
  qmake
  make
}

package() {
  cd selectdefaultapplication
  install -dm755 ${pkgdir}/usr/bin/
  install -m755 selectdefaultapplication ${pkgdir}/usr/bin/
}
