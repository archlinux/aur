# Maintainer: Mattia Biondi <mattia biondi1 at gmail dot com>
_name=umps
_ver=3
pkgname=$_name$_ver
pkgver=3.0.1
pkgrel=2
pkgdesc="Virtual machine simulator based around the MIPS R2/3000 microprocessor."
arch=('x86_64')
url="https://github.com/virtualsquare/umps3"
license=('GPL3')
makedepends=('cmake' 'qt5-base' 'libelf' 'boost' 'libsigc++' 'cross-mipsel-linux-gnu-gcc')
optdepends=('cross-mipsel-linux-gnu-gcc: compile programs for µMPS')
conflicts=('umps3-git')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('0f3072ac6295f58f9980d43f0dd3991771ebe6b1cd1d1c55b08323b06edac674')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
