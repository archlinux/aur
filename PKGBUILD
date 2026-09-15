# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-vlang-app
pkgver=0.2.1
pkgrel=1
pkgdesc="V-native scaffolding CLI for the V programming language (source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/Create-Vlang-App/create-vlang-app"
license=('MIT')
depends=('git')
makedepends=('vlang')
provides=('create-vlang-app' 'create-awesome-vlang-app')
conflicts=('create-awesome-vlang-app-bin' 'create-vlang-app')
source=("create-awesome-vlang-app-${pkgver}.tar.gz::https://github.com/Create-Vlang-App/create-vlang-app/archive/refs/tags/create-vlang-app@0.2.1.tar.gz")
sha256sums=('afb1cbc1221f275ad205018eb32b46d7e41b5183f6a1d3cb1adffee42197d9b5')

build() {
  cd "create-vlang-app-create-vlang-app-0.2.1"
  make build
}

package() {
  cd "create-vlang-app-create-vlang-app-0.2.1"
  install -Dm755 create-vlang-app "$pkgdir/usr/bin/create-vlang-app"
  ln -s create-vlang-app "$pkgdir/usr/bin/create-awesome-vlang-app"
}
