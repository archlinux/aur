# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=qmarkdowntextedit-git
pkgver=r328.e566a3c
pkgrel=1
pkgdesc='A Qt library and simple application for editing Markdown'
arch=('i686' 'x86_64')
url='https://github.com/pbek/qmarkdowntextedit'
license=('MIT')
depends=('qt5-base')
conflicts=(qmarkdowntextedit)
provides=(qmarkdowntextedit)
source=('git+https://github.com/sandsmark/qmarkdowntextedit.git#branch=martin/install-target')
md5sums=('SKIP')

pkgver() {
  cd qmarkdowntextedit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd qmarkdowntextedit
  qmake
  make
}

package() {
  cd qmarkdowntextedit
  make INSTALL_ROOT="$pkgdir" install
}
