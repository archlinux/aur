# Maintainer: zedxihan <dev@gaffarmahmud.com>
pkgname=corganizer
pkgver=1.1.0
pkgrel=1
pkgdesc="A blazing fast, memory-safe CLI tool to automatically organize your cluttered files"
arch=('x86_64' 'aarch64')
url="https://github.com/zedxihan/corganizer"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
provides=('corganizer')
conflicts=('corganizer-git')
source=("https://github.com/zedxihan/corganizer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a70785de45394a4cf547fc45d4941644858146f2037cac4af278e8b95ca0ba95')

build() {
  cd "${pkgname}-${pkgver}"
  make release
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
