# Maintainer: Jonathan Eyolfson <jon@eyl.io>
pkgname=dynamorio-bin
pkgver=10.0.0
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
source=("https://github.com/DynamoRIO/dynamorio/releases/download/release_${pkgver}/DynamoRIO-Linux-${pkgver}.tar.gz")
sha256sums=('21eaa23570e12dfa5eab8443589481c1eaedfc73ce71647720d121d2e3ba74d6')

package() {
  cd "${srcdir}/DynamoRIO-Linux-${pkgver}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "${pkgdir}/opt/dynamorio"
  cp -a * ${pkgdir}/opt/dynamorio

  find ${pkgdir}/opt/dynamorio/ -type f -executable -exec chmod 755 {} \;
  find ${pkgdir}/opt/dynamorio/ -type f -not -executable -exec chmod 644 {} \;
  find ${pkgdir}/opt/dynamorio/ -type d -exec chmod 755 {} \;
}
