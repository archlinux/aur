# Maintainer: CareF <CareF.lm@gmail.com>

pkgname=deepin-dock-plugin-arch-update
pkgver=2.2
pkgrel=1
pkgdesc="A plugin for deepin dock, Arch Linux update indicator"
arch=('x86_64')
url="https://github.com/CareF/deepin-dock-plugin-arch-update"
depends=('deepin-dock' 'pacman-contrib')
makedepends=('git' 'qt5-base' 'dtkcore')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CareF/deepin-dock-plugin-arch-update/archive/v${pkgver}.tar.gz")
md5sums=('a3df7484be6b76c46d2fcbeb6d64150b')

build() {
  qmake "$srcdir/$pkgname-$pkgver/source"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir" install
}
