# Maintainer: yaroslav <proninyaroslav@mail.ru>

pkgname=android-file-transfer
pkgver=2.3
pkgrel=1
pkgdesc="Android MTP client with minimalistic UI."
arch=('i686' 'x86_64')
url="https://github.com/whoozle/android-file-transfer-linux"
license=('GPL2')
depends=('qt5-base' 'fuse')
makedepends=('cmake')
source=("https://github.com/whoozle/android-file-transfer-linux/archive/v${pkgver}.tar.gz")
md5sums=('42cb2ff57ec6525cd2040f8e1989e504')

build() {
  cd "${srcdir}/${pkgname}-linux-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  make
}
package() {
  cd "${srcdir}/${pkgname}-linux-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
