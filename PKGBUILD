# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=hota-redux
pkgver=2.0.0
pkgrel=1
pkgdesc="Heart of The Alien engine reimplementation"
arch=('x86_64')
url="https://github.com/carstene1ns/hota-redux"
license=('GPLv2')
depends=('sdl3' 'sdl3_mixer')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cad8c5188ed2c26205d6acddf4b5161b84e1dfc644021f6a1598ff42244cf03d')

prepare() {
  rm -rf aurbuild
}

build() {
  cmake -B aurbuild -S hota-redux-$pkgver \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build aurbuild
}

package() {
  install -Dm755 aurbuild/alien "$pkgdir"/usr/bin/alien
}
