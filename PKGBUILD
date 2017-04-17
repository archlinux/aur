# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Gustavo Castro <gustawho at gmail dot com>
pkgname=indicator-kdeconnect
pkgver=0.7.1.r4.gc694300
pkgrel=1
_gitname=indicator-kdeconnect
pkgdesc="Integrate KDEConnect on desktop environments that use AppIndicators (e.g. Unity)"
arch=('any')
url="https://github.com/bajoja/indicator-kdeconnect"
license=('GPL')
depends=('libappindicator-gtk3' 'kdeconnect' 'vala')
makedepends=('git' 'cmake')
source=('git://github.com/bajoja/indicator-kdeconnect.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd indicator-kdeconnect
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR="${pkgdir}" install
}
