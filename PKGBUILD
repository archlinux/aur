# Maintainer: Mattia Biondi <mattia biondi1 at gmail dot com>
_name=umps
_ver=3
pkgname=$_name$_ver
pkgver=3.0.0
pkgrel=1
pkgdesc="Virtual machine simulator based around the MIPS R2/3000 microprocessor."
arch=('x86_64')
url="https://github.com/virtualsquare/umps3"
license=('GPL3')
depends=('qt5-base' 'libelf' 'boost' 'libsigc++' "cross-mipsel-linux-gnu-gcc")
makedepends=('cmake')
conflicts=("umps3-git")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('045bdca958d16a951ddcacf23f59ec2f7d0fafaf775adcd10e828a7b3d11f523')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
