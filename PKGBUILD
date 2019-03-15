# Maintainer: xsmile <>
pkgname=ifrextractor-ls
pkgver=0.3.6
pkgrel=1
pkgdesc='Utility that can extract the internal forms represenation from both EFI and UEFI modules'
arch=('any')
url='https://github.com/LongSoft/Universal-IFR-Extractor'
license=('GPL3')
makedepends=('cmake' 'git')
provides=('ifrextractor')
conflicts=('ifrextractor')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('c749212a5ba631671fbbe96e6d7f0fcf')

prepare() {
  cd Universal-IFR-Extractor-${pkgver}
  mkdir -p build
  cd build
  cmake ..
}

build() {
  cd Universal-IFR-Extractor-${pkgver}/build
  make
}

package() {
  cd Universal-IFR-Extractor-${pkgver}/build
  install -Dm755 ifrextract -t "$pkgdir"/usr/bin
}
