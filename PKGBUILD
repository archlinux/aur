# Maintainer: CareF <CareF.lm@gmail.com>

pkgname=deepin-dock-plugin-arch-update
pkgver=1.0
pkgrel=1
pkgdesc="A plugin for deepin dock, Arch Linux update indicator"
arch=('x86_64')
url="https://github.com/CareF/deepin-dock-plugin-arch-update"
depends=('deepin-dock')
makedepends=('git' 'qt5-base' 'dtkcore')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CareF/deepin-dock-plugin-arch-update/archive/v${pkgver}.tar.gz")
md5sums=('4e41c0886c702dd0284ed0e716f0d791')

build() {
  qmake "$srcdir/$pkgname-$pkgver/source"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir" install
}
