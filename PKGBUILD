# Maintainer: k88936 email: kvtodev@outlook.com

pkgname=shotmd
pkgver=1.0.0
pkgrel=1
pkgdesc="A Screenshot tool for easy insert picture to markdown"
arch=('x86_64')
url="https://github.com/k88936/shotmd"
license=('GPL3')
depends=('openssl')
makedepends=('base-devel' 'git' 'cmake' 'gcc' 'qt6-base')
source=("git+https://github.com/k88936/shotmd.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
