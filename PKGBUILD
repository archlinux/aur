# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=klog
pkgver=0.9.3
pkgrel=1
pkgdesc='Ham radio logging program'
arch=('i686' 'x86_64')
url='http://jaime.robles.es/klog'
license=('GPL3')
depends=('kdebase-runtime' 'hamlib')
makedepends=('automoc4' 'cmake')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('46df382328ff4681036fd1d719069f4aaab94a8defc3cb50e5706448f5a34c6c')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  qmake-qt5 PREFIX=/usr KLog.pro
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  install -Dm644 klog.1 "${pkgdir}"/usr/share/man/man1/klog.1
  install -Dm755 build/target/klog "${pkgdir}"/usr/bin/klog
}
