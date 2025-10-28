# Maintainer: Samuel Åkesson <sermuns@lysator.liu.se>
pkgname=penguin
pkgver=0.2.7
pkgrel=1
pkgdesc='Dev server with auto-reload, static file server, proxy support, and more. Language and framework agnostic.'
url='https://github.com/LukasKalbertodt/penguin'
source=("https://github.com/LukasKalbertodt/penguin/archive/refs/tags/app-v$pkgver.tar.gz")
arch=('x86_64')
license=('Apache-2.0' 'MIT')
makedepends=('cargo')
sha256sums=('2e8f3f5eec4f265997f3c6f39d6f58d16e842b515b3a992e8c8b0837425efc3e')
options=(!debug)

build() {
  cd "penguin-app-v$pkgver/app"
  cargo build --release
}

package() {
  cd "penguin-app-v$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
