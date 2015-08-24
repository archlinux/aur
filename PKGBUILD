# Maintainer: Jonathan Eyolfson <jon@eyl.io>
pkgname=dynamorio
pkgver=5.0.0
_pkgver=5.0.0-9
pkgrel=3
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
source=("http://dl.bintray.com/bruening/DynamoRIO/DynamoRIO-Linux-${_pkgver}.tar.gz")
sha256sums=('2b9ec200e2113f78ceb04c73e6bc9f74049d12a8a2e1f1dda1d23bf905e04057')

package() {
  cd "${srcdir}/DynamoRIO-Linux-${_pkgver}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "${pkgdir}/opt/dynamorio"
  chmod 755 lib32/debug/libdynamorio.so.5.0
  chmod 755 lib64/debug/libdynamorio.so.5.0
  chmod 755 lib32/release/libdynamorio.so.5.0
  chmod 755 lib64/release/libdynamorio.so.5.0
  cp -a * ${pkgdir}/opt/dynamorio
}
