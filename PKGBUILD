# Maintainer: Jonathan Eyolfson <jon@eyl.io>
pkgname=dynamorio
pkgver=6.1.1
_pkgver=6.1.1-3
pkgrel=1
pkgdesc="A dynamic binary instrumentation framework"
url="http://dynamorio.org"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/DynamoRIO/dynamorio/releases/download/release_6_1_1/DynamoRIO-Linux-${_pkgver}.tar.gz")
sha256sums=('fd6dc856a9fc88662ab9d86874e472ffbef35fccf1bf4a71da0ab94c31c36a22')

package() {
  cd "${srcdir}/DynamoRIO-Linux-${_pkgver}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "${pkgdir}/opt/dynamorio"
  chmod 755 lib32/debug/libdynamorio.so.6.0
  chmod 755 lib64/debug/libdynamorio.so.6.0
  chmod 755 lib32/release/libdynamorio.so.6.0
  chmod 755 lib64/release/libdynamorio.so.6.0
  cp -a * ${pkgdir}/opt/dynamorio
}
