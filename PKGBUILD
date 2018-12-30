# Maintainer: xsmile <>
pkgname=ifrextractor-ls
pkgver=0.3.5
pkgrel=1
pkgdesc='Utility that can extract the internal forms represenation from both EFI and UEFI modules'
arch=('any')
url='https://github.com/LongSoft/Universal-IFR-Extractor'
license=('GPL3')
makedepends=('cmake' 'git')
provides=('ifrextractor')
conflicts=('ifrextractor')
source=("${pkgname}::git+${url}.git#commit=7789d0a10185a8b31439d70d7848c106dcceee70")
md5sums=('SKIP')

prepare() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake ..
}

build() {
  cd $pkgname/build
  make
}

package() {
  cd $pkgname/build
  install -Dm755 ifrextract -t "$pkgdir"/usr/bin
}
