# Maintainer: Martin Czygan <martin.czygan@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=zek-bin
pkgver=0.1.16
pkgrel=1
pkgdesc="Generate a Go struct from XML"
arch=('x86_64')
url='https://github.com/miku/zek'
license=('GPL3')
provides=('zek')
depends=('glibc')
source=("${pkgname}-${pkgver}.deb::https://github.com/miku/zek/releases/download/v${pkgver}/zek_${pkgver}_amd64.deb")
sha256sums=('c4b65446890a321f1f59bba3fc2e618d3119d2e729a599f5590421ba09c4fd0d')

package() {
  cd "${srcdir}"
  tar xvf data.tar.xz -C "${pkgdir}"
  cd ${pkgdir}/usr
  mv sbin bin
  chmod 755 bin/zek
}
