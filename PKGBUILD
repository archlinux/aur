# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-vlang-app
pkgver=0.1.0
pkgrel=1
pkgdesc="V-native scaffolding CLI for the V programming language (source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/Create-Vlang-App/create-vlang-app"
license=('MIT')
depends=('git')
makedepends=('vlang')
provides=('create-vlang-app' 'create-awesome-vlang-app')
conflicts=('create-awesome-vlang-app-bin' 'create-vlang-app')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Create-Vlang-App/create-vlang-app/archive/refs/tags/create-vlang-app@0.1.0.tar.gz")
sha256sums=('f7c1f62f8eab3bcd4e55b05700924c864f182247ff7c050c39884f5013592729')

build() {
  cd "create-vlang-app-create-vlang-app-0.1.0"
  make build
}

package() {
  cd "create-vlang-app-create-vlang-app-0.1.0"
  install -Dm755 create-vlang-app "$pkgdir/usr/bin/create-vlang-app"
  ln -s create-vlang-app "$pkgdir/usr/bin/create-awesome-vlang-app"
}
