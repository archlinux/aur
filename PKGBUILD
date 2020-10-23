# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mkusb
pkgver=0.2.3
pkgrel=1
pkgdesc="A shell script to create ISO multiboot USB flash drives that support both legacy and EFI boot"
arch=('any')
url="https://github.com/lilyinstarlight/mkusb"
license=('MIT')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lilyinstarlight/mkusb/archive/v${pkgver}.tar.gz")
sha256sums=('2a0808dbaf43ec37d1bf27e1471a65f30b6ea9e83eb027ef2fb6b6b7fb97a529')

package() {
  cd "${pkgname}-${pkgver}"
  sed -i '1s|usr/local|usr|' makefile
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
