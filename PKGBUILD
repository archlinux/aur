# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=extra-imageformats-qt-git
pkgver=r11.fe4356c
pkgrel=1
pkgdesc='bpg, pgf and fuif support for Qt'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/extra-imageformats-qt'
license=('LGPL')
depends=('qt5-base')
optdepends=(
    'libbpg: BPG supprt'
    'libpgf: PGF support'
)
makedepends=('git' 'cmake')
conflicts=(extra-imageformats-qt)
provides=(extra-imageformats-qt)
source=('git://github.com/sandsmark/extra-imageformats-qt.git')
md5sums=('SKIP')

pkgver() {
  cd extra-imageformats-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd extra-imageformats-qt
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd extra-imageformats-qt
  make DESTDIR="$pkgdir" install
}
