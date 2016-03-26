# Maintainer: John W. Trengrove <john@retrofilter.com>

pkgname=libtap-git
_pkgname=libtap
pkgver=0.1.0.16.gd2109aa
pkgrel=1
pkgdesc="C testing library implementing the Test Anything Protocol"
arch=('x86_64' 'i686')
url="https://github.com/zorgnax/libtap"
license=('LGPL')
source=("git+https://github.com/zorgnax/libtap")
depends=('glibc')
makedepends=('git')
conflicts=('libtap')
provides=('libtap')
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd ${_pkgname}
  make
}

package() {
  cd ${_pkgname}
  make PREFIX="${pkgdir}/usr" install
}
