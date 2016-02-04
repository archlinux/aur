# Maintainer: yaroslav <proninyaroslav@mail.ru>

pkgname=android-file-transfer
pkgver=2.4
pkgrel=1
pkgdesc="Android MTP client with minimalistic UI."
arch=('i686' 'x86_64')
url="https://github.com/whoozle/android-file-transfer-linux"
license=('GPL3')
depends=('qt5-base' 'fuse' 'libxkbcommon-x11')
makedepends=('cmake')
conflicts=('android-file-transfer-linux-git')
source=("https://github.com/whoozle/android-file-transfer-linux/archive/v${pkgver}.tar.gz")
sha256sums=('ce51656babd15d6742af86de97fe1566311860e1e4a99763c59f1cd99d028314')

build() {
cd "${srcdir}/${pkgname}-linux-${pkgver}"
cmake -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
make
}
package() {
cd "${srcdir}/${pkgname}-linux-${pkgver}"
make DESTDIR="$pkgdir/" install
}
