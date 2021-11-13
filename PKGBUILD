# Maintainer: Pavel Lymarev <x-user at bk dot ru>

pkgname=efi-mkuki
pkgver=0.1.0
pkgrel=1
pkgdesc='EFI Unified Kernel Image Maker'
arch=(any)
url='https://github.com/jirutka/efi-mkuki/#readme'
license=(MIT)
depends=(binutils)
optdepends=('systemd: Default EFI stub files')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jirutka/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf8b9653412af39adc44dd5b9875fcd45ad677ff0fae80c4b3f8644920ba9305')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make prefix=/usr DESTDIR="${pkgdir}" EFISTUB_DIR=/usr/lib/systemd/boot/efi install
}
