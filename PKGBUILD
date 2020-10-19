# Maintainer: Mattia Biondi <mattia biondi1 at gmail dot com>
_name=umps
_ver=3
pkgname=$_name$_ver
pkgver=3.0.2
pkgrel=1
pkgdesc="Virtual machine simulator based around the MIPS R2/3000 microprocessor."
arch=('x86_64')
url="https://github.com/virtualsquare/umps3"
license=('GPL3')
makedepends=('cmake' 'qt5-base' 'libelf' 'boost' 'libsigc++' 'cross-mipsel-linux-gnu-gcc')
optdepends=('cross-mipsel-linux-gnu-gcc: compile programs for µMPS')
conflicts=('umps3-git')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('268d9294e02ab0bdbf8c24d24135f5e9ccf80d837763c60fa4ae50f384914fbe')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
