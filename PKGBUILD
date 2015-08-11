# Maintainer: shimi <shimi.chen@gmail.com>
# Contributor: Gustavo Castro <gustawho at gmail dot com>
pkgname=indicator-kdeconnect-git
pkgver=51.2f8ae36
pkgrel=3
_gitname=indicator-kdeconnect
pkgdesc="Integrate KDEConnect on desktop environments that use AppIndicators (e.g. Unity)"
arch=('any')
url="https://github.com/vikoadi/indicator-kdeconnect"
license=('GPL')
depends=('libappindicator-gtk3' 'kdeconnect' 'vala')
makedepends=('git' 'cmake')
source=('git://github.com/vikoadi/indicator-kdeconnect.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd indicator-kdeconnect
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR="${pkgdir}" install
}
