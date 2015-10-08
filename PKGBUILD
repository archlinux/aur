# Maintainer: Jonathan Eyolfson <jon@eyl.io>
pkgname=dynamorio
pkgver=6.0.0
_pkgver=6.0.0-6
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
source=("https://github.com/DynamoRIO/dynamorio/releases/download/release_6_0_0/DynamoRIO-Linux-${_pkgver}.tar.gz")
sha256sums=('ae24c4e53d15e065e82c342d4ee61a3f06e29a65e95bbcc854017daf996000da')

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
