# Maintainer: xsmile <sascha_r gmx de>
pkgname=ifrextractor-ls
pkgver=0.1
pkgrel=1
pkgdesc='Utility that can extract the internal forms represenation from both EFI and UEFI modules'
arch=('any')
url='https://github.com/LongSoft/Universal-IFR-Extractor'
license=('GPL3')
makedepends=('cmake' 'git')
provides=('ifrextractor')
conflicts=('ifrextractor')
source=("${pkgname}::git+${url}.git#commit=4f9699de9388e29cd31954563b0cf817f8af9f64")
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
