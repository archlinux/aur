# Maintainer: Jordan Ayvazian <jaayvazian@gmail.com>
pkgname=lightspp-git
pkgver=0.2
pkgrel=1
pkgdesc="(Dev Branch) A C++ API for interacting with phillips hue lights"
arch=('x86_64')
url="https://github.com/jorbo/lightsplusplus"
license=('GPL')
depends=('gcc' 'git' 'libcurlpp' 'jsoncpp')
conflicts=('lightspp')

build() {
  git clone --branch dev https://github.com/jorbo/lightsplusplus
  cd lightsplusplus
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd lightsplusplus/build
  sudo cp src/liblightsplusplus.a /usr/lib
}
