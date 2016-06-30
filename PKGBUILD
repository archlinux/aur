# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=qgnomeplatform
_srcname=QGnomePlatform
_commit=c603662
_revision=16
pkgver=0.1.r$_revision.g$_commit
pkgrel=1
pkgdesc='QPlatformTheme for a better Qt application inclusion in GNOME.'
arch=('i686' 'x86_64')
url='https://github.com/MartinBriza/QGnomePlatform'
license=('LGPL2.1')
depends=('qt5-base')
makedepends=('git')
provides=('qgnomeplatform')
conflicts=('qgnomeplatform')
source=("git+https://github.com/MartinBriza/$_srcname.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $_srcname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_srcname
  qmake-qt5
  make
}

check() {
  cd $_srcname
  make -k check
}

package() {
  cd $_srcname
  make INSTALL_ROOT="$pkgdir/" install
}
