# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-vlang-app
pkgver=0.2.3
pkgrel=1
pkgdesc="V-native scaffolding CLI for the V programming language (source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/Create-Vlang-App/create-vlang-app"
license=('MIT')
depends=('git')
makedepends=('vlang')
provides=('create-vlang-app' 'create-awesome-vlang-app')
conflicts=('create-awesome-vlang-app-bin' 'create-vlang-app')
source=("create-awesome-vlang-app-${pkgver}.tar.gz::https://github.com/Create-Vlang-App/create-vlang-app/archive/refs/tags/create-vlang-app@0.2.3.tar.gz")
sha256sums=('8ca1a046c0460323384fff793a062cb219f607aefc894b506b8877db18a3b006')

build() {
  cd "create-vlang-app-create-vlang-app-0.2.3"
  make build
}

package() {
  cd "create-vlang-app-create-vlang-app-0.2.3"
  install -Dm755 create-vlang-app "$pkgdir/usr/bin/create-vlang-app"
  ln -s create-vlang-app "$pkgdir/usr/bin/create-awesome-vlang-app"
}
