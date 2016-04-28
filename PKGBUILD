# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=qactus-git
pkgver=v0.6.0.r1.gd99d5cd
pkgrel=1
pkgdesc="A Qt-based OBS notifier application."
arch=('i686' 'x86_64')
url="https://github.com/javierllorente/qactus"
license=('GPL2' 'GPL3')
depends=('qtkeychain-qt5')
makedepends=('git')
conflicts=('qactus')
provides=('qactus')
source=('git://github.com/javierllorente/qactus.git')
md5sums=('SKIP')

pkgver() {
  cd qactus
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd qactus
  qmake-qt5 PREFIX=/usr qactus.pro
  make
}

package() {
  cd qactus
  make INSTALL_ROOT="${pkgdir}" install
}
