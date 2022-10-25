# Maintainer: Martin Czygan <martin.czygan@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=zek-bin
pkgver=0.1.17
pkgrel=1
pkgdesc="Generate a Go struct from XML"
arch=('x86_64')
url='https://github.com/miku/zek'
license=('GPL3')
provides=('zek')
depends=('glibc')
source=("${pkgname}-${pkgver}.deb::https://github.com/miku/zek/releases/download/v${pkgver}/zek_${pkgver}_amd64.deb")
sha256sums=('004dd1b389f69bfada8fef1a976dc0808be0094c1c64d67b685073e23d096035')

package() {
  cd "${srcdir}"
  tar xvf data.tar.xz -C "${pkgdir}"
  cd ${pkgdir}/usr
  mv sbin bin
  chmod 755 bin/zek
}
