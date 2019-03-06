# Maintainer: corubba <corubba at gmx dot de>
pkgname=purple-icyque-git
pkgver=r26.c0187fe
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for ICQ WIM protocol"
arch=('any')
url="https://github.com/EionRobb/icyque"
license=('GPL')
depends=('libpurple')
makedepends=('json-glib')
source=('icyque::git+https://github.com/EionRobb/icyque.git')
md5sums=('SKIP')

pkgver() {
  cd "icyque"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "icyque"
  make
}

package() {
  cd "icyque"
  make DESTDIR="${pkgdir}/" install
}
