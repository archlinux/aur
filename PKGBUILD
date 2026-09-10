# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-vlang-app
pkgver=0.2.0
pkgrel=1
pkgdesc="V-native scaffolding CLI for the V programming language (source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/Create-Vlang-App/create-vlang-app"
license=('MIT')
depends=('git')
makedepends=('vlang')
provides=('create-vlang-app' 'create-awesome-vlang-app')
conflicts=('create-awesome-vlang-app-bin' 'create-vlang-app')
source=("create-awesome-vlang-app-${pkgver}.tar.gz::https://github.com/Create-Vlang-App/create-vlang-app/archive/refs/tags/create-vlang-app@0.2.0.tar.gz")
sha256sums=('c4230da44b6d2b170846a60e1b1b91b06533f12ac3690499157323381b35613c')

build() {
  cd "create-vlang-app-create-vlang-app-0.2.0"
  make build
}

package() {
  cd "create-vlang-app-create-vlang-app-0.2.0"
  install -Dm755 create-vlang-app "$pkgdir/usr/bin/create-vlang-app"
  ln -s create-vlang-app "$pkgdir/usr/bin/create-awesome-vlang-app"
}
