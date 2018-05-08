# Maintainer: Simon Schäfer <simon.schaefer+aur@koeln.de>
pkgname=qjsonrpc
pkgver=r348.f85751b
pkgrel=1
pkgdesc="QJsonRpc is a Qt implementation of the JSON-RPC protocol. It integrates nicely with Qt, leveraging Qt's meta object system in order to provide services over the JSON-RPC protocol"
arch=('i686' 'x86_64')
url='https://bitbucket.org/devonit/qjsonrpc'
license=('LGPL2')
depends=('qt5-base')
makedepends=('git')
source=('git+https://bitbucket.org/devonit/qjsonrpc.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../${pkgname}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
}
