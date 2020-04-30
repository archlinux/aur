# Maintainer:  Jah Way <jahway603 at protonmail dot com>
pkgname=silentdragonlite
pkgver=1.2.2
pkgrel=2
pkgdesc='HUSH Lite wallet that supports zaddrs'
url='http://github.com/MyHush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MyHush/SilentDragonLite/archive/v$pkgver.tar.gz")
sha256sums=('SKIP') # will get from dev for next pkg update

build() {
  tar xzvf $pkgname-$pkgver.tar.gz
  cd "SilentDragonLite-$pkgver"
  ./build.sh
}

package() {
  cd "SilentDragonLite-$pkgver"
  sudo mv SilentDragonLite /usr/bin/silentdragonlite
}
