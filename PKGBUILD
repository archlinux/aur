# Maintainer: aimileus <me at aimileus dot nl>
# Contributor: Sebastian Gumprich <aur at gumpri dot ch>
# Contributor: twa022
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Gustavo Castro <gustawho at gmail dot com>
pkgname=indicator-kdeconnect
epoch=1
pkgver=0.9.2
pkgrel=1
pkgdesc="Integrate KDEConnect on desktop environments that use AppIndicators (e.g. Unity)"
arch=('any')
url="https://github.com/bajoja/indicator-kdeconnect"
license=('GPL')
conflicts=("${pkgname}-git")
depends=('libappindicator-gtk3' 'kdeconnect' 'vala' 'python-requests-oauthlib' 'python-gobject')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Bajoja/indicator-kdeconnect/archive/${pkgver}.tar.gz")
sha256sums=('daf3fce34aa729771bbca47020b46d2fff64575234212c8fb5dbb60ccf9dfa40')

build() {
  cd "${pkgname}-${pkgver}"
  [ ! -d build ] && mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}
