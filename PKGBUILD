 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=liquidshell-git
pkgver=r64.9cc1429
pkgrel=1
pkgdesc='liquidshell is an alternative to plasmashell'
arch=('x86_64')
url='https://cgit.kde.org/liquidshell.git/'
license=('GPL3')
depends=('networkmanager-qt' 'bluez-qt' 'kcmutils')
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("${pkgname}-${pkgver}::git+git://anongit.kde.org/liquidshell.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}-${pkgver}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build && cd build
  cmake  ..
     
  make
    
  }

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/build/liquidshell ${pkgdir}/usr/bin/liquidshell
}
